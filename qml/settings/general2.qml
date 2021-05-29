import QtQuick 2.0
import "../composonts"
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.3

Rectangle  {
    id: page2
    anchors.fill: parent
    ColumnLayout {

        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 20
        anchors.bottomMargin: 10
        anchors.fill: parent



        RowLayout {
            width: 592
            height: 40
            Layout.preferredWidth: 592
            Layout.fillWidth: true

            Text {

                text: qsTr("show top bar")
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: 12
            }

            Switch {
                id: switchshowtopbar
                text: qsTr("Switch")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }
        }


        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.preferredWidth: 592
            Text {
                id: showclockhomepage1
                text: qsTr("show temperature on top bar")
                Layout.fillWidth: true
                font.pixelSize: 12
                font.bold: true
            }

            Switch {
                id: switchshowtemperaturetop
                text: qsTr("Switch")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }
        }


        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.preferredWidth: 592
            Text {
                id: showclockhomepage
                text: qsTr("show clock on home page")
                Layout.fillWidth: true
                font.pixelSize: 12
                font.bold: true
            }

            Switch {
                id: switchshowclockhome
                text: qsTr("Switch")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }
        }

        RowLayout {

            height: 100
            Layout.fillWidth: true
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            Button {
                id: btbprev
                text: qsTr("preview")
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 10
                onClicked:
                {
                    // stackgeneral.push(page1)
                    generalLoader.source = "general1.qml"

                }

            }
        }
    }



}






/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:12;anchors_x:530;anchors_y:338}D{i:1;anchors_x:10;anchors_y:25}
}
 ##^##*/
