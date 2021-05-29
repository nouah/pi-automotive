import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
Rectangle {
   // property alias  bglanel:

    Image {
        id: backgroundImage
        antialiasing: true
        anchors.fill: parent
        source: "qrc:/usr/shar/pictures/wallpaper/17973903.jpg"
        rotation: 180
    }
    Label{
        id:bglanel
        x: 124
        y: 15
        text: mtools.usbfolder

    }

}
