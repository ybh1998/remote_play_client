#include <QApplication>
#include <QQmlApplicationEngine>
#include "connection.h"
#include "imageprovider.h"
#include "defines.h"
#include <QtQml>

extern AVFrame *frame = new AVFrame;
int main(int argc, char *argv[])
{
    avcodec_register_all();
    memset(frame,0,sizeof(AVFrame));
    QApplication app(argc, argv);
    qmlRegisterType<Connection> ("ybh1998.Connection",0,1,"Connection");
    QQmlApplicationEngine engine;
    engine.addImageProvider(QLatin1String("player"),new ImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
