#ifndef CONNECTION_H
#define CONNECTION_H

#include <QObject>
#include <QUdpSocket>
#include <QEventLoop>
#include <QTimer>
#include "defines.h"

extern AVFrame *frame;
class Connection : public QUdpSocket
{
    Q_OBJECT
public:
    Q_INVOKABLE void update();
    Q_INVOKABLE void mouse_move(int x,int y);
    Q_INVOKABLE void key_down(QString key);
    Q_INVOKABLE void type(QString key);
    Q_INVOKABLE void key_up(QString key);
    Q_INVOKABLE void mouse_down(int key);
    Q_INVOKABLE void mouse_up(int key);
    Q_INVOKABLE void start(int index);
    Q_INVOKABLE void stop();
    Q_INVOKABLE void login(QString username,QString password);
    Connection();
    QHostAddress addr;
private:
    void send(int id, uint8_t *data, int size);
    void receive();
    int gameid=0;
    QTimer keepalive;
    AVCodec *decodec;
    AVCodecContext *decodecctx;
    SwsContext *swsctx;
    AVFrame *frameyuv;
    AVPacket *packet=new AVPacket;
signals:
    void updateSig(QString ver,QString url);
    void loginSig(int res);
    void startSig(int index);
    void videoSig();
};

#endif // CONNECTION_H
