import QtQuick 2.0
import "../composonts"
Rectangle {
    anchors.fill: parent
   // top:StatusBar.bottom
    color: "red"
    Text {
        id: audio
        text: "<h1>"+qsTr("bluetooth")+"</H1>"
    }

}
