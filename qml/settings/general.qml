import QtQuick 2.0
import "../composonts"
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.3
Item {
//    Material.theme: Material.Dark
//    Material.accent: Material.DeepOrange
    id:general
    anchors.fill: parent

//    mainLoader.source:"qrc:/qml/settings/general1.qml"
    Loader {
        id: generalLoader
        source: "qrc:/qml/settings/general1.qml"
   }
}
