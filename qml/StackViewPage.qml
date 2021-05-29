import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.2
import "qrc:/qml/outils/virtualkeyboard/controls" as CONTROLS

Item {
    anchors.fill: parent
    NumberAnimation
    {
        duration: 300
        id: flickableAnimation
    }
    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: "home.qml"

    }


}
