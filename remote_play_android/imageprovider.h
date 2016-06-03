#ifndef IMAGEPROVIDER_H
#define IMAGEPROVIDER_H

#include <QObject>
#include <QQuickImageProvider>
#include "defines.h"

extern AVFrame *frame;
class ImageProvider : public QQuickImageProvider
{
public:

    ImageProvider(): QQuickImageProvider(QQuickImageProvider::Image){
    }
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize){
        int got;
        //qDebug() << QString("update %1").arg(time(NULL));
        return QImage(frame->data[0],width,height,QImage::Format_RGB32);
    }
};

#endif // IMAGEPROVIDER_H
