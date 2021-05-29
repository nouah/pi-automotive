import QtQuick 2.12
import QtWebEngine 1.8
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.1
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.2
import "qrc:/qml/outils/virtualkeyboard/controls" as CONTROLS

Flickable{
    id: pageFlickable
    width: parent.width
    height: parent.height
    boundsBehavior: Flickable.StopAtBounds
    //flickableDirection: Flickable.AutoFlickDirection
   // contentWidth: rowlay.implicitWidth

    contentHeight: webView.implicitHeight
    flickableDirection: Flickable.VerticalFlick
    Column {
        anchors.fill: parent
        height: parent.height
        width: parent.width
        WebEngineView {
            anchors.fill: parent
            id:webView
            url: "https://m.youtube.com"
            //anchors.fill: parent




            // ...
            onJavaScriptDialogRequested: function(request) {
                request.accepted = true;
                myDialog.request = request // keep the reference to the request
                myDialog.accept.connect(request.dialogAccept);
                myDialog.reject.connect(request.dialogReject);
                myDialog.visible = true;
            }
            onGeometryChangeRequested: {
                window.x = geometry.x
                window.y = geometry.y
                window.width = geometry.width
                window.height = geometry.height
            }



            onContextMenuRequested: function(request) {
                request.accepted = true
            }

            onHeightChanged: {
                pageFlickable.contentHeight = webView.height + 150
            }

            onScrollPositionChanged: {
                // console.log("scroll: " + scrollPosition.y)
            }

            onNewViewRequested: function(request) {
                Qt.openUrlExternally(request.requestedUrl)
            }


            onLoadingChanged: {

                webView.runJavaScript(
                            "document.documentElement.scrollHeight;", function (i_actualPageHeight) {webView.height = i_actualPageHeight; });

                if (loadRequest.errorString)
                    console.error(loadRequest.errorString);
            }



        }
    }


    ScrollBar.vertical: ScrollBar {
        width: 15
        policy: ScrollBar.AlwaysOn
    }


}
