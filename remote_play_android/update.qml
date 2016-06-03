import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "vars.js" as Vars

Item{
    anchors.fill: parent;
    Connections{
        target: connection
        onUpdateSig:{
            if(ver==Vars.ver){
                mainloader.source="login.qml"
            }else{
                state.text=qsTr("New version %1 detected").arg(ver)
                button.visible=true
                button.url=url
            }
        }
    }
    Rectangle{
        id:topboard
        width: parent.width
        height: parent.height/10
        color: "purple"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text:qsTr(" Update")
            color: "white"
        }
    }
    ColumnLayout{
        spacing: 10
        anchors.centerIn: parent
        Text {
            id: state
            text: qsTr("Checking for update")
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
            color: "grey"
            text: qsTr("Current ver: %1").arg(Vars.ver);
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button{
            property string url: ""
            visible: false;
            id:button
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Download")
            onClicked: {
                Qt.openUrlExternally(url)
            }
        }
    }
}
