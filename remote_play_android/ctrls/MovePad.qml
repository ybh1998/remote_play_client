import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "qrc:/vars.js" as Vars

Item{
    MultiPointTouchArea{
        anchors.fill: parent
        touchPoints: [
            TouchPoint{
                id: ctrl_touch
            }
        ]
    }
    property int mouseX: ctrl_touch.sceneX
    property int mouseY: ctrl_touch.sceneY
    property int centerX: x-anchors.margins+width/2
    property int centerY: y-anchors.margins+height/2
    property bool up_key: false
    property bool down_key: false
    property bool left_key: false
    property bool right_key: false
    property bool shift_key: false
    property bool space_key: false
    Timer{
        interval: 100;running: true;repeat: true
        onTriggered: parent.key_calc()
    }
    function key_calc(){
        var mx=mouseX-anchors.margins-centerX
        var my=-(mouseY-anchors.margins-centerY)
        var u=false,d=false,l=false,r=false,sh=false,sp=false
        if(!ctrl_touch.pressed){
            posi_show.visible=false
        }else{
            var dist=Math.sqrt(Math.pow(mx,2)+Math.pow(my,2))
            if(dist>main_win.buttonsize){
                mx/=dist/main_win.buttonsize
                my/=dist/main_win.buttonsize
            }
            posi_show.x=mx+anchors.margins+centerX-x-main_win.buttonsize/4
            posi_show.y=-my+anchors.margins+centerY-y-main_win.buttonsize/4
            posi_show.visible=true
            if(dist<main_win.buttonsize/6){
                sh=true
            }else{
                if(dist<main_win.buttonsize/2) sh=true
                else if(dist>main_win.buttonsize/6*5) sp=true
                var angle=Math.atan(my/mx)/Math.PI*180
                if(mx<0) angle+=180
                if(mx>0&&my<0) angle+=360
                if(angle<22.5||angle>=337.5) r=true
                if(angle>=22.5&&angle<67.5) r=u=true
                if(angle>=67.5&&angle<112.5) u=true
                if(angle>=112.5&&angle<157.5) u=l=true
                if(angle>=157.5&&angle<202.5) l=true
                if(angle>=202.5&&angle<247.5) l=d=true
                if(angle>=247.5&&angle<292.5) d=true
                if(angle>=292.5&&angle<337.5) d=r=true
            }
        }
        if(up_key==true&&u==false) connection.key_up("w")
        if(up_key==false&&u==true) connection.key_down("w")
        up_key=u
        if(down_key==true&&d==false) connection.key_up("s")
        if(down_key==false&&d==true) connection.key_down("s")
        down_key=d
        if(left_key==true&&l==false) connection.key_up("a")
        if(left_key==false&&l==true) connection.key_down("a")
        left_key=l
        if(right_key==true&&r==false) connection.key_up("d")
        if(right_key==false&&r==true) connection.key_down("d")
        right_key=r
        if(shift_key==true&&sh==false) connection.key_up("shift")
        if(shift_key==false&&sh==true) connection.key_down("shift")
        shift_key=sh
        if(space_key==true&&sp==false) connection.key_up("space")
        if(space_key==false&&sp==true) connection.key_down("space")
        space_key=sp
    }
    Rectangle{
        anchors.fill: parent
        color: "red"
        radius: main_win.buttonsize
        opacity: main_win.playeropacity
    }
    Rectangle{
        anchors.centerIn: parent
        color: "yellow"
        radius: main_win.buttonsize/6*5
        opacity: main_win.playeropacity
        width: radius*2
        height: radius*2
    }
    Rectangle{
        anchors.centerIn: parent
        color: "blue"
        radius: main_win.buttonsize/2
        opacity: main_win.playeropacity
        width: radius*2
        height: radius*2
    }
    Rectangle{
        anchors.centerIn: parent
        color: "white"
        radius: main_win.buttonsize/6
        opacity: main_win.playeropacity
        width: radius*2
        height: radius*2
    }

    Rectangle{
        id:posi_show
        color: "orange"
        radius: main_win.buttonsize/4
        width: radius*2
        height: radius*2
        visible: false
    }
}
