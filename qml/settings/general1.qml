import QtQuick 2.12
import "../composonts"
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.3
import Qt.labs.settings 1.1
//import QtQuick.VirtualKeyboard 2.4
//import QtQuick.VirtualKeyboard.Settings 2.2
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.12
//import "qrc:/qml/outils/virtualkeyboard/controls" as CONTROLS
Item {

    id: page1

    anchors.fill: parent


    ColumnLayout {
        spacing: 1
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

                text: qsTr("Time Format")
                font.bold: true
                font.pixelSize: 12

            }



            RadioButton {
                id: time24
                x: 400
                text: qsTr("24")
                focusPolicy: Qt.StrongFocus
                font.weight: Font.Bold
                Layout.rightMargin: 0
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                checked:settingmain.time24value
                wheelEnabled: false

                autoExclusive: true
                onCheckedChanged:settingmain.time24value=time24.checked


            }

            RadioButton {
                id: time12
                x: 400
                text: qsTr("12")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                font.weight: Font.Bold
                checked: settingmain.time12value
                font.bold: true
                wheelEnabled: false
                autoExclusive: true

                onCheckedChanged: {

                    settingmain.time12value=time12.checked}
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.preferredWidth: 592
            Text {

                text: qsTr("Tomperature Unit")
                font.pixelSize: 12
                font.bold: true
            }

            RadioButton {
                id: radiotempf
                x: 300
                text: "°F"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                font.bold: true
                checked: settingmain.radiotempfvalue
                onClicked: {
                    settingmain.radiotempcvalue=false
                    settingmain.radiotempfvalue=true
                }
            }

            RadioButton {
                id: radiotempc
                x: 400
                width: 64
                text: qsTr("°C")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.fillWidth: false
                font.bold: true
                checked: settingmain.radiotempcvalue
                Layout.fillHeight: false
                wheelEnabled: false
                autoExclusive: true
                onClicked: {
                    settingmain.radiotempcvalue=true
                    settingmain.radiotempfvalue=false
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true

            Text {

                text: qsTr("Brigtness")
                font.bold: true
                Layout.preferredHeight: 27
                Layout.preferredWidth: 102
                font.pixelSize: 12
            }

            Slider {
                id: sliderlbritness
                to: 100
                stepSize: 1
                Layout.preferredHeight: 40
                Layout.preferredWidth: 485
                value: settingmain.sliderlbritnessvalue
                onValueChanged: {
                settingmain.sliderlbritnessvalue=sliderlbritness.value

                }
            }
        }

        RowLayout {
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Text {

                text: qsTr("your name")
                font.bold: true
                Layout.preferredWidth: 102
                font.pixelSize: 12
                Layout.preferredHeight: 27
            }

            TextEdit {
                id: textName
                x: 396
                width: 80
                height: 20
                text: qsTr("Text Edit")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.fillWidth: false
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 12
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Text {

                text: qsTr("Controls Opacity")
                font.bold: true
                Layout.preferredWidth: 102
                font.pixelSize: 12
                Layout.preferredHeight: 27
            }

            Slider {
                id: slideropacity
                orientation: Qt.Horizontal
                snapMode: Slider.NoSnap
                stepSize: 1
                to: 100
                Layout.preferredWidth: 485
                value: settingmain.slideropacityvalue
                Layout.preferredHeight: 40
                onValueChanged: {
                settingmain.slideropacityvalue=slideropacity.value
                }
            }
        }


        RowLayout {
            width: 592
            height: 40
            Layout.fillWidth: true
            Layout.preferredWidth: 592
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
                checked: settingmain.switchshowtopbarvalue
                onClicked: {
                settingmain.switchshowtopbarvalue=switchshowtopbar.checked
                }
            }

        }


        RowLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 592
            Layout.preferredHeight: 40
            Text {
                id: showtemphomepage
                text: qsTr("show temperature on top bar")
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: 12

            }

            Switch {
                id: switchshowtempetop
                text: qsTr("Switch")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                checked: settingmain.switchshowtempetopvalue
                onClicked: {
                settingmain.switchshowtempetopvalue=switchshowtempetop.checked
                }
            }

        }


        RowLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 592
            Layout.preferredHeight: 40
            Text {
                id: showclockhomepage
                text: qsTr("show clock on home page")
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: 12
            }

            Switch {
                id: switchshowclockhome
                text: qsTr("Switch")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                checked: settingmain.switchshowclockhomevalue
                onClicked: {
                settingmain.switchshowclockhomevalue=switchshowclockhome.checked
                }
            }

        }

        RowLayout {
            width: 592
            height: 40
            visible: false
            Layout.fillWidth: true

            Text {

                text: qsTr("Others Options")
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: 12
            }

            Button {
                id: btnnext
                text: qsTr("next")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 10
                onClicked:
                {
                    generalLoader.source = "general2.qml"
                    //stackgeneral.push()

                    //  Loader.source="genral2.qml";
                }

            }
        }
    }




}

















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_x:24;anchors_y:85}
}
 ##^##*/
