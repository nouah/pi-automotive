import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.0
import QtWebEngine 1.8
import "apps"
Item {
    id: appshome
    Loader {
        id: pageLoader
        anchors.fill: parent
    }
    GridLayout {
        rowSpacing: 15
        columnSpacing: 15
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        anchors.fill: parent
        rows: 4
        columns: 4
        signal qmlSignal
        Image {

            id: youtube
            width: 100
            height: 100
            sourceSize.height: 50
            sourceSize.width: 50
            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit




            source:"qrc:/icons/svg/youtube-logo-1.svg"
            MouseArea{
                anchors.fill: parent
                 onClicked: mainLoader.source="qrc:/qml/apps/youtube.qml"
               // onClicked: qmlSignal()
            }


        }

        Image {
            id: fb
            width: 100
            height: 100
            sourceSize.height: 50
            sourceSize.width: 50
            Layout.fillHeight: true
            Layout.fillWidth: true
            fillMode: Image.PreserveAspectFit



            source:"qrc:/icons/svg/facebook-logo-1.svg"
            MouseArea{
                anchors.fill: parent
                onClicked: mainLoader.source="qrc:/qml/apps/facebook.qml"
            }


        }

        Image {
            id: image
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            //source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image1
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: ""
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image2
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            //source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image3
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            //source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image4
            width: 100
            height: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            //source: "qrc:/qtquickplugin/images/template_image.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image5
            width: 100
            height: 100
            //source: "qrc:/qtquickplugin/images/template_image.png"
            Layout.fillHeight: true
            fillMode: Image.PreserveAspectFit
            Layout.fillWidth: true
        }
    }


}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
