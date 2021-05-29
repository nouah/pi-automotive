import QtQuick 2.0
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.0
Rectangle {
    id: badgeapp
    width: 100
    height: 100
    color: "#ffffff"


    border.color: "black"
    smooth: true
    property string  badgeabel: badgetext.text="TEXT HERE"
    property string imagesource:badgeimage.source
    //signal buttonClicked();

    //*************************mous hover animation*******************
    states: [ "pressed", "released" ]
    state: "pressed"

    transitions: [
        Transition {
            from: "*"
            to: "pressed"
            NumberAnimation {
                target: badgeapp
                properties: "scale"
                from: 0.95
                to: 1
                duration:500
                easing.type: Easing.OutBounce
            }
        }
    ]

    MouseArea{
        id: im1MouseArea
        anchors.bottomMargin: 0
        hoverEnabled: true
        anchors.fill: parent

        onContainsMouseChanged: {
            badgeapp.state = containsMouse ? "pressed" : "released"
        }
    }
    //*************************ShaderEffect
    radius: 1
    border.width: 1
    // color: "steelblue"
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: -8
        verticalOffset: -8
        //spread: 10
        //samples: 17
        color: "#99000000"
    }

    Image {
        id: badgeimage
        width: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.leftMargin: 0
        Layout.rightMargin: 0
        Layout.bottomMargin: 0
        //source: "../../usr/shar/pictures/music.jpg"
        source:imagesource
        fillMode: Image.PreserveAspectCrop
    }

    Text {
        id: badgetext
        text: badgeabel
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 80
        Layout.topMargin: 80
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 10
        horizontalAlignment: Text.AlignHCenter
        Layout.minimumWidth: 50
        Layout.minimumHeight: 50
        Layout.fillHeight: false
        Layout.fillWidth: false
        transformOrigin: Item.Bottom


    }







}











/*##^## Designer {
    D{i:0;invisible:true}D{i:1;anchors_height:200}D{i:8;anchors_height:50;anchors_x:0;anchors_y:"-52"}
D{i:7;anchors_height:50;anchors_x:0;anchors_y:205}D{i:5;anchors_height:213;anchors_width:145;anchors_x:8;anchors_y:10}
}
 ##^##*/
