import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: bootommenu
    height: 40
    //color: "#000000"
    anchors.left: parent.left
    anchors.leftMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors {
        // left: parent.left
        top: parent.Bottom-40
        //right: parent.right
    }


    RowLayout {
        id: buttonRow
        width: 106
        height: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        spacing: 0

        Button {
            id: backButtton
            width: 100
            text: "Back"
            autoExclusive: false
            flat: false
            Layout.fillHeight: true
            Layout.fillWidth: true
            transformOrigin: Item.Center
            onClicked: mainLoader.source = "qrc:/qml/StackViewPage.qml"
        }

}
}
