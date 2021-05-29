import QtQuick 2.0
import "../composonts"
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
Rectangle {

    id: rectangle
    anchors.fill: parent


    ColumnLayout {
        y: 45
        height: 109
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        Row{
            id: row
            height: 20
            Layout.fillWidth: true

            Text {

                text: qsTr("Autoplay sound")
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
            }

            Switch {
                id: autoplaysound
                text: qsTr("Switch")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                font.bold: true
                font.family: "Times New Roman"
                checked:settingmain.soundautolplay
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                onCheckedChanged:  settingmain.soundautolplay=autoplaysound.checked

            }
        }

        Row{
            id: row1
            height: 20
            Layout.fillWidth: true
            Text {

                text: qsTr("AutoLoad sound")
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 12
            }

            Switch {
                id: autoLoadsound
                text: qsTr("Switch")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0
                font.bold: true
                font.family: "Times New Roman"
                checked:settingmain.soundautoLoad
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                onCheckedChanged:  settingmain.soundautoLoad=autoLoadsound.checked

            }
        }
    }

}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_x:46;anchors_y:45}
}
 ##^##*/
