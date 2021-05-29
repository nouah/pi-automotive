import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "composonts"
import QtQuick.Controls.Material 2.4
import QtMultimedia 5.9
import Qt.labs.settings 1.1
import Qt.labs.folderlistmodel 2.1

ApplicationWindow {
    id: window
     title:"automtive"
     width: 800
    height: 480
    visible: true
   //VirtualKeyboardSettings.locale :"en_GB"
   //property player audio



    property bool amuted: false
//     property string soundfolder:"file://";
//     property string rootfolder:"file://"+mtools.usbfolder;





    Settings{
        id:settingmain
        //property player audio
        property bool soundautolplay:false
        property bool soundautoLoad: false
        property int clockx: 431
        property int clocky: 77
        property int miniplayx: 368
        property int miniplayy: 5
        property bool time24value: true
        property bool time12value: false
        property bool radiotempcvalue:true
        property bool radiotempfvalue:false
        property real sliderlbritnessvalue:0
        property real slidercontrastvalue:0
        property real slideropacityvalue:0
        property bool switchshowtopbarvalue:true
        property bool switchshowtempetopvalue:true
        property bool switchshowclockhomevalue: true

    }






    ///////pour player

    Audio {
        id: playMusic

        autoPlay: settingmain.soundautolplay
        autoLoad: settingmain.soundautoLoad
        muted: amuted


    }
    FolderListModel {
        id: folderModel
        //rootFolder:rootdfolder
        //folder: soundfolder
        showDirs: true
        //showDotAndDotDot:true

        nameFilters: ["*.mp3","*.wma","*.ogg"]

    }
    Connections {
        target: mtools
        onSendToQml: {

            folderModel.folder = "file://"+mtools.usbfolder; // Set the counter to the text label
            folderModel.rootFolder= "file://"+mtools.usbfolder;

            console.log("QMl usbfolder====="+"file://"+mtools.usbfolder);
            console.log("QMl rootFolder====="+folderModel.rootFolder);
            console.log("QMl Folder====="+folderModel.folder);

            folderModel.submit();
        }
    }
//////////////
    StatusBar{
        id: statubar
        height: 40
        z: 1
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        visible: settingmain.switchshowtopbarvalue
    }


    SidBar {
        id:sidbar
        width: 40
        anchors.topMargin: statubar.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        z: 1

        Layout.preferredWidth: 40
        // height: 480
        //anchors.rightMargin: 700
        // sidbar.top: statubar.height
    }

    Loader {
        id: mainLoader
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 6
        z: 3
        anchors.leftMargin: sidbar.width
        source: "StackViewPage.qml"
    }

    function openCamera() {
        content.openCamera()
    }



}


/*##^## Designer {
    D{i:1;anchors_y:0}
}
 ##^##*/
