import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "qrc:/vars.js" as Vars

ListView{
    Rectangle{
        anchors.fill: parent
        height: parent.height
        width: parent.width*0.4
        border.color: "purple"
        Column{
            anchors.fill: parent
            Rectangle{
                id:topboard
                width: parent.width
                height: parent.height/10
                color: "purple"
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    text:qsTr(" Settings")
                    color: "white"
                }
                Button{
                    anchors.margins: 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    text:qsTr("Back")
                    onClicked: loader.visible=false;
                }
            }
            anchors.margins: 3
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3
            width: parent.width - 6
            RowLayout{
                width: parent.width
                Text{text:qsTr("Pad size:")}
                Slider{
                    id:size_slider
                    Layout.fillWidth: true;
                    value: 0.2
                    minimumValue: 0.1
                    stepSize: 0.05
                    maximumValue: 0.4
                    onValueChanged: main_win.buttonsize=main_win.height*value
                }
                Text{text:(size_slider.value*2.5).toFixed(3)}
            }
            RowLayout{
                width: parent.width
                Text{text:qsTr("Pad opacity:")}
                Slider{
                    Layout.fillWidth: true
                    id: op_slider
                    value: 0.3
                    minimumValue: 0
                    maximumValue: 1
                    onValueChanged: main_win.playeropacity=value
                    stepSize: 0.1
                }
                Text{text:op_slider.value.toFixed(3)}
            }
            RowLayout{
                width: parent.width
                Text{text:qsTr("Mouse sensivity:")}
                Slider{
                    Layout.fillWidth: true
                    id: sensi_slider
                    value: 96
                    minimumValue: 48
                    maximumValue: 192
                    onValueChanged: main_win.sensivity=value
                    stepSize: 16
                }
                Text{text:sensi_slider.value}
            }
        }
    }
}
