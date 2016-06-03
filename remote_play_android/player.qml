import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "vars.js" as Vars

Item {
    anchors.fill: parent
    focus: true
    Keys.enabled: true
    Connections{
        target:connection
        onVideoSig:{
                image.source="image://player/main/" + Math.random();
        }
    }
    /*Timer{
        interval: 50;running: true;repeat: true;
        onTriggered:{
            image.source="image://player/main/" + Math.random();
        }
    }
*/
    Keys.onPressed: {
        if(event.key==16777313){
            connection.stop()
            event.accepted = true
            mainloader.source="menu.qml"
        }
    }
    Image{
        anchors.fill: parent
        id:image
        smooth: false
        cache: false
       // asynchronous: true
    }
    Loader{
        anchors.fill: parent
        source: Vars.url+main_win.gameid+".qml"
    }
}
