import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "qrc:/vars.js" as Vars
Item{
    Timer{
        id:holdtimer
        interval: 800;running: false;repeat: false;
        onTriggered: {
            if(back_touch.pressed&&Math.abs(back_touch.holdX-back_touch.sceneX)<main_win.buttonsize/4&&Math.abs(back_touch.holdY-back_touch.sceneY)<main_win.buttonsize/4){
                connection.mouse_down(1);
                back_touch.hoding=true;
            }
        }
    }
    anchors.fill: parent
    MultiPointTouchArea{
        anchors.fill: parent
        touchPoints: [
            TouchPoint{
                property double presstime: 0
                property bool hoding: false
                property bool firstpress: false
                property int holdX: 0
                property int holdY: 0
                id: back_touch
                onPressedChanged: {
                    var time = new Date();
                    if(pressed){
                        firstpress=true;
                        holdX=sceneX;
                        holdY=sceneY;
                        holdtimer.start();
                        presstime=time.getTime();
                    }else{
                        if(hoding){
                            hoding=false;
                            connection.mouse_up(1);
                            return;
                        }
                        if(time.getTime()-presstime<300){
                            connection.mouse_down(leftkey.defclick ? 1 : 3);
                            connection.mouse_up(leftkey.defclick ? 1 : 3);
                        }
                    }
                }
            }
        ]
    }
    property int lastx: 0
    property int lasty: 0
    Timer{
        id:key_delay
        interval: 170; repeat: true;running: true
        onTriggered: {
             if(back_touch.firstpress){
                 back_touch.firstpress=false;
                 parent.lastx=back_touch.sceneX
                 parent.lasty=back_touch.sceneY
                 return;
             }
             var mx=back_touch.sceneX-parent.lastx
             var my=back_touch.sceneY-parent.lasty
             if(mx==0&&my==0) return
             connection.mouse_move(mx/main_win.buttonsize*main_win.sensivity,my/main_win.buttonsize*main_win.sensivity)
             parent.lastx=back_touch.sceneX
             parent.lasty=back_touch.sceneY
        }
    }
}
