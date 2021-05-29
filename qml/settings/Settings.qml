import QtQuick 2.12
import "../composonts"
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.1
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.2
import "qrc:/qml/outils/virtualkeyboard/controls" as CONTROLS

Rectangle {
  TabBar {
    id:bar
    visible: true
    width: parent.width

     TabButton  {
        text: "General"
    }
     TabButton  {
        text: "Audio"
    }
     TabButton  {
        text: "weather"
    }
     TabButton  {
        text: "Video"
    }
}



StackLayout{
    id :layoutsettings
    anchors.topMargin: bar.height
    anchors.fill: parent
    currentIndex: bar.currentIndex

    Rectangle{ visible: true; Layout.fillHeight: true; Layout.fillWidth: true; Loader { anchors.fill: parent; source:"general.qml"; }
    }
    Rectangle{
        visible: false
        Layout.fillHeight: true
        Layout.fillWidth: true
        Loader { anchors.fill: parent; source:"audio.qml";}
    }
    Rectangle{
        visible: false
        Layout.fillHeight: true
        Layout.fillWidth: true
        Loader { anchors.fill: parent; source:"weather.qml";}
    }
    Rectangle{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Loader { anchors.fill: parent; source:"video.qml";}
    }
}
NumberAnimation  {

    duration: 300
    id: flickableAnimation
}
InputPanel {
     id: inputPanel
     anchors.left: parent.left
     anchors.right: parent.right
     anchors.bottom: parent.bottom
     property bool textEntered: Qt.inputMethod.visible
     // Hmm - why is this necessary?
     property real realHeight: height/1.65
     opacity: 0
     NumberAnimation on opacity
     {
         id: keyboardAnimation
         onStarted: {
             if(to === 1) {
                 inputPanel.visible = true
             }
         }
         onFinished: {
             if(to === 0) {
                 inputPanel.visible = false
             }
         }
     }
     onTextEnteredChanged: {
         var rectInput = Qt.inputMethod.anchorRectangle
         if (inputPanel.textEntered)
         {
            if(rectInput.bottom > inputPanel.y)
            {
                flickableAnimation.to = rectInput.bottom - inputPanel.y + 10
                flickableAnimation.start()
            }
            keyboardAnimation.to = 1
            keyboardAnimation.duration = 500
            keyboardAnimation.start()
         }
         else
         {
             if(parent.contentY !== 0)
             {
                 flickableAnimation.to = 0
                 flickableAnimation.start()
             }
             keyboardAnimation.to = 0
             keyboardAnimation.duration = 0
             keyboardAnimation.start()
         }
     }

}

}
