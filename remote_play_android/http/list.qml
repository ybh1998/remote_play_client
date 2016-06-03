import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "qrc:/vars.js" as Vars
ColumnLayout{
    anchors.fill: parent
    Rectangle{
        id:topboard
        width: parent.width
        height: parent.height/10
        color: "purple"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text:qsTr(" Game list")
            color: "white"
        }
    }
    GridView{
        anchors.top: topboard.bottom
        anchors.bottom: parent.bottom
        width:parent.width
        cellHeight: 150
        cellWidth: width/2
        model:ListModel{
            ListElement{index:1;name: "MineCraft";description:"Minecraft 1.7.10";}
        }
        delegate: Rectangle{
            anchors.margins: 2
            border.color: "orange"
            width: parent.width/2-2*anchors.margins
            height: 150-2*anchors.margins
            RowLayout{
                spacing: 2
                anchors.fill: parent
                Image{
                    height: 100
                    width: 100
                    source: Vars.url+index+".jpg"
                }
                Column{
                    Layout.fillWidth: true
                    spacing: 2
                    Text{
                        text: name
                    }
                    Text{
                        text:description
                    }
                }
                Button{
                    anchors.verticalCenter: parent.verticalCenter
                    text:qsTr("Enter")
                    onClicked: {
                        connection.start(index)
                    }
                }
            }
        }
    }
}
