import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: statubar
    height: 40
    anchors {
        left: parent.left
        //top: parent.bottom+40
        right: parent.right
    }

    Row {
        id: statusrow
        spacing: 10
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft

        Text {
            id: statusText
            color: "#000000"
            font.pixelSize: 12
            text: "21C° 12:55 PM"
            Layout.fillHeight: true
            fontSizeMode: Text.HorizontalFit
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12

        }

        Image {
            id: name
            y: 0
            width: 40
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            source: "qrc:/icons/svg/volume-up-interface-symbol.svg"
        }

    }

}

/*##^## Designer {
    D{i:1;anchors_height:40;anchors_width:200}
}
 ##^##*/
