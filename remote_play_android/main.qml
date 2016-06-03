import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import ybh1998.Connection 0.1

ApplicationWindow {
    id:main_win
    property int sensivity: 96
    property int buttonsize: height/5
    property int gameid: 0
    property double playeropacity: 0.3
    title: qsTr("Remote Play")
    width: 800
    height: 480
    visible: true
    Connection{
        id:connection
        onStartSig:{
            gameid=index
            mainloader.source="player.qml"
        }
    }
    Timer{
        interval: 1000;repeat: false;running: true;
        onTriggered: connection.update()
    }
    Rectangle{
        anchors.fill: parent
        Loader{
            anchors.fill: parent
            id: mainloader
            source: "update.qml"
        }
    }
}
