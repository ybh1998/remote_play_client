import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "qrc:/vars.js" as Vars
import "qrc:/ctrls/"
Item{
    MousePad{
        anchors.fill: parent
    }
    MovePad{
        width: main_win.buttonsize*2
        height: main_win.buttonsize*2
        anchors.margins: main_win.buttonsize/2
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }
    RowLayout{
        height: main_win.buttonsize/2
        spacing: 2
        width: parent.width
        Rectangle{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"E"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("e"); parent.color="orange"}
                onReleased:{ connection.key_up("e"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"T"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("t"); parent.color="orange"}
                onReleased:{ connection.key_up("t"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"R"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("r"); parent.color="orange"}
                onReleased:{ connection.key_up("r"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"U"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("u"); parent.color="orange"}
                onReleased:{ connection.key_up("u"); parent.color="white"}
            }
        }
        Button{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            text:"Settings"
            onClicked: loader.visible=true
        }
        Item{
            Layout.fillWidth: true
        }
        TextField{
            id:type_text
            height: parent.height
        }
        Rectangle{
            opacity: main_win.playeropacity
            height: parent.height
            width: parent.height
            Text{
                opacity: main_win.playeropacity
                anchors.centerIn: parent
                text:"Enter"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{
                    connection.type(type_text.text);
                    type_text.text="";
                    connection.key_down("Return"); parent.color="orange"
                }
                onReleased:{ connection.key_up("Return"); parent.color="white"}
            }
        }
    }

    Row{
        height: parent.width/20
        spacing: 0
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"1"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("1"); parent.color="orange"}
                onReleased:{ connection.key_up("1"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"2"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("2"); parent.color="orange"}
                onReleased:{ connection.key_up("2"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"3"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("3"); parent.color="orange"}
                onReleased:{ connection.key_up("3"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"4"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("4"); parent.color="orange"}
                onReleased:{ connection.key_up("4"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"5"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("5"); parent.color="orange"}
                onReleased:{ connection.key_up("5"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"6"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("6"); parent.color="orange"}
                onReleased:{ connection.key_up("6"); parent.color="white"}
            }
        }Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"7"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("7"); parent.color="orange"}
                onReleased:{ connection.key_up("7"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"8"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("8"); parent.color="orange"}
                onReleased:{ connection.key_up("8"); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity/2
            height: parent.height
            width: parent.height
            Text{
                anchors.centerIn: parent
                text:"9"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.key_down("9"); parent.color="orange"}
                onReleased:{ connection.key_up("9"); parent.color="white"}
            }
        }
    }
    Row{
        anchors.margins: main_win.buttonsize/2
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        spacing: main_win.buttonsize/10
        Rectangle{
            opacity: main_win.playeropacity
            id:leftkey
            border.width: defclick ? main_win.buttonsize/6 : 0
            border.color: "blue"
            property bool defclick: true
            radius: main_win.buttonsize/2
            width: radius*2
            height: radius*2
            Text{
                anchors.centerIn: parent
                text:"left"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.mouse_down(1); parent.color="orange";leftkey.defclick=true;}
                onReleased:{ connection.mouse_up(1); parent.color="white"}
            }
        }
        Rectangle{
            opacity: main_win.playeropacity
            border.width: defclick ? main_win.buttonsize/6 : 0
            border.color: "blue"
            property bool defclick: !leftkey.defclick
            radius: main_win.buttonsize/2
            width: radius*2
            height: radius*2
            Text{
                anchors.centerIn: parent
                text:"right"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:{ connection.mouse_down(3); parent.color="orange";leftkey.defclick=false;}
                onReleased:{ connection.mouse_up(3); parent.color="white"}
            }
        }
    }
    Loader{
        anchors.fill: parent
        id:loader
        source: "qrc:/setting.qml"
        visible: false
    }
}
