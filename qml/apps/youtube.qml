import QtQuick 2.12
import QtWebEngine 1.8
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.1
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.2
import "qrc:/qml/outils/virtualkeyboard/controls" as CONTROLS


  WebEngineView {
    url: "https://m.youtube.com"
    //anchors.fill: parent


   // fullScreenRequested: true
    onContextMenuRequested: {
         request.accepted = true;
     }    
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

}



