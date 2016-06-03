import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "vars.js" as Vars
Item{
    anchors.fill: parent
    Connections{
        target: connection
        onLoginSig:{
            if(res==0)
                mainloader.source="menu.qml"
            if(res==1)
                state.text=qsTr("User does not exist")
            if(res==2)
                state.text=qsTr("Wrong password")
            if(res==3)
                state.text=qsTr("Please login again")
        }
    }
    Rectangle{
        id:topboard
        width: parent.width
        height: parent.height/10
        color: "purple"
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text:qsTr(" Login")
            color: "white"
        }
    }
    ColumnLayout{
        spacing: 10
        anchors.centerIn: parent
        Text{
            id:state
            color: "red"
        }
        RowLayout{
            Text{
                text:qsTr("Username:")
            }
            TextField{
                id:username
            }
        }
        RowLayout{
            Text{
                text:qsTr("Password:")
            }
            TextField{
                id:password
                echoMode: TextInput.Password
            }
        }
        Button{
            id:login
            text: qsTr("Login")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked:{
                if(username.text==""){
                    state.text=qsTr("Username is empty");
                    return;
                }
                if(password.text==""){
                    state.text=qsTr("Password is empty");
                    return;
                }
                connection.login(username.text,password.text)
            }
        }
    }
}
