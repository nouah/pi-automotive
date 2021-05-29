import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

Item {
    id: element
    width: 400
    height: 400

    StackLayout {
        id: stackLayout
        anchors.fill: parent

        Item {
            clip: false

            TextField {
                id: textField
                x: 55
                y: 75
                text: qsTr("Text Field")
            }
        }

        Item {
            RadioButton {
                id: radioButton
                x: 160
                y: 136
                text: qsTr("Radio Button")
            }

            RadioButton {
                id: radioButton1
                x: 119
                y: 149
                width: 97
                height: 25
                text: qsTr("Radio Button")
            }
        }
    }
    Button {
        id: backButtton
        anchors {
            bottom: parent.bottom
            left: parent.left
            margins: 40
        }
        text: "Back"
        onClicked: mainLoader.source = "qrc:/qml/StackViewPage.qml"
    }
}



/*##^## Designer {
    D{i:1;anchors_height:392;anchors_width:400;anchors_x:0;anchors_y:8}
}
 ##^##*/
