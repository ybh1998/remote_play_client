#include "connection.h"
#include <QCryptographicHash>
#include <QThread>
#include <QHostAddress>
#include <QHostInfo>

Connection::Connection()
{
    addr=(QHostInfo::fromName(dns)).addresses().first();
    connectToHost(QHostAddress (addr),port);
    connect(this,&Connection::readyRead,this,&Connection::receive);
    frameyuv=avcodec_alloc_frame();
    frame=avcodec_alloc_frame();
    decodec=avcodec_find_decoder(CODEC);
    decodecctx=avcodec_alloc_context3(decodec);
    decodecctx->time_base = (AVRational){1,25};
    decodecctx->width = width;
    decodecctx->height = height;
    decodecctx->bit_rate = bitrate;
    decodecctx->gop_size = 1;
    decodecctx->max_b_frames=1;
    decodecctx->pix_fmt = AV_PIX_FMT_YUV420P;
    swsctx=sws_getContext(width,height,PIX_FMT_YUV420P,
                          width,height,PIX_FMT_RGB32,
                          SWS_BICUBIC,NULL,NULL,NULL);
    avcodec_open2(decodecctx,decodec,NULL);
    av_image_alloc(frame->data,frame->linesize,width,height,PIX_FMT_RGB32,1);
    memset(packet,0,sizeof(AVPacket));
}
void Connection::send(int id, uint8_t *data, int size){
    uint8_t *tmpdata = (uint8_t *)malloc(size+4);
    *((int *)tmpdata)=id;
    memcpy((void *)(tmpdata+4),(void *)data,size);
    writeDatagram((char *)tmpdata,size+4,addr,port);
}

void Connection::receive(){
    uint8_t *data = (uint8_t *)malloc(buffer);
    int id,size;
    while(hasPendingDatagrams()){
        size = readDatagram((char *)data,buffer);
        id=(int)(*data);
        data+=4;
        switch (id) {
        case UPDATE:{
            QString tmpstr((char*)data);
            QStringList tmplst=tmpstr.split(' ');
            emit updateSig(tmplst[0],tmplst[1]);
            break;
        }
        case LOGIN:{
            int res=(int)(*data);
            emit loginSig(res);
            break;
        }
        case START:{
            emit startSig(gameid);
            break;
        }
        case VIDEO:{
            //qDebug("got %d",time(NULL));
            int got;
            packet->size=size;
            packet->data=(uint8_t *)malloc(size);
            memcpy((void *)packet->data,(void *)data,size);
            packet->pts++;
            avcodec_decode_video2(decodecctx,frameyuv,&got,packet);
            sws_scale(swsctx,(const uint8_t **)frameyuv->data,frameyuv->linesize,
                      0,height,frame->data,frame->linesize);
            emit videoSig();
            break;
        }
        default:
            break;
        }
        data-=4;
    }
    free(data);
}
void Connection::update(){
    send(UPDATE,NULL,0);
    keepalive.start(timeout*1000/3);
    connect(&keepalive,&QTimer::timeout,[=](){
        send(KEEPALIVE,NULL,0);
    });
}
void Connection::login(QString username, QString password){
    QByteArray tmpadd = username.toLocal8Bit()+" "+QCryptographicHash::hash ( password.toLocal8Bit(), QCryptographicHash::Md5 );
    send(LOGIN,(uint8_t *)tmpadd.toStdString().data(),tmpadd.size()*sizeof(char));
}
void Connection::start(int index){
    gameid=index;
    send(START,(uint8_t *)&index,sizeof(int));
}
void Connection::stop(){
    send(STOP,NULL,0);
}
void Connection::mouse_move(int x, int y){
    int tmp[2]={x,y};
    send(MOUSE_MOVE,(uint8_t *)tmp,2*sizeof(int));
}
void Connection::key_down(QString key){
    send(KEY_DOWN,(uint8_t *)key.toStdString().data(),key.size()*sizeof(char));
    QThread::msleep(50);
}
void Connection::key_up(QString key){
    send(KEY_UP,(uint8_t *)key.toStdString().data(),key.size()*sizeof(char));
}
void Connection::type(QString key){
    send(TYPE,(uint8_t *)key.toStdString().data(),key.size()*sizeof(char));
}
void Connection::mouse_down(int key){
    send(MOUSE_DOWN,(uint8_t *)(&key),sizeof(int));
    QThread::msleep(50);
}
void Connection::mouse_up(int key){
    send(MOUSE_UP,(uint8_t *)(&key),sizeof(int));
}
