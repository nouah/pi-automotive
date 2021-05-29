import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
//import QtDeviceUtilities.LocalDeviceSettings 1.0
import QtQuick.Controls.Material 2.5
Item {
    id: sidbar
    width: 40
    //color: "#222121"
    //Material.theme: Material.Dark
    Material.accent: Material.DeepOrange
    ColumnLayout {
        id: coll
        width: 40
        anchors.fill: parent
        transformOrigin: Item.Left
        spacing: 0

        Button {

            id: btnhome
            width: 40
            height: 100
            text: "home"
            Layout.preferredWidth: -1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            flat: true
            Layout.fillWidth: true
            checked: true
            autoExclusive: true
            icon.source: "qrc:/icons/svg/home.svg"
            onClicked: mainLoader.source="qrc:/qml/home.qml"

        }

        Button {
            id: btnapps
            width: 40
            height: 100
            Layout.fillWidth: true
            Layout.preferredWidth: -1
            Layout.fillHeight: true
            clip: false
            smooth: true
            flat: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            checkable: true
            autoExclusive: true

            icon.source: "qrc:/icons/svg/four-black-squares.svg"
            onClicked:{
                mainLoader.source="qrc:/qml/appshome.qml"
            }
        }

        Button {
            id: btnsettings
            width: 40
            height: 100
            Layout.preferredWidth: -1
            Layout.fillHeight: true
            flat: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            checkable: true
            autoExclusive: true

            icon.source: "qrc:/icons/svg/cog-wheel-silhouette.svg"
            onClicked:{

              mainLoader.source="qrc:/qml/settings/Settings.qml"
            }
        }


        Button {
            id: navigation
            y: 361
            width: 40
            height: 100
            Layout.preferredWidth: -1
            highlighted: false
            Layout.fillHeight: true
            wheelEnabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: true
            flat: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            checkable: true
            autoExclusive: true
            icon.source: "qrc:/icons/svg/map-marker.svg"
            onClicked: mainLoader.source="qrc:/qml/maps/Maps.qml"
        }
        Button {
            id: shutdown
            y: 361
            width: 40
            height: 100
            Layout.preferredWidth: -1
            highlighted: false
            Layout.fillHeight: true
            wheelEnabled: false
            focusPolicy: Qt.NoFocus
            hoverEnabled: true
            flat: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            checkable: true
            autoExclusive: true
            icon.source: "qrc:/icons/svg/map-marker.svg"
            onClicked: mainLoader.source="qrc:/qml/maps/Maps.qml"
        }



    }
}



/*##^## Designer {
    D{i:1;anchors_height:480;anchors_width:40}
}
 ##^##*/
