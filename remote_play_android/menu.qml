import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "vars.js" as Vars

RowLayout{
    anchors.fill: parent
    spacing: 0
    Rectangle{
        border.width: 2
        height: parent.height
        width: parent.width
        border.color: "purple"
        Loader{
            anchors.margins: 2
            anchors.fill: parent
            source: Vars.url+"list.qml"
        }
    }
}
