import QtQuick 2.0
import QtMultimedia 5.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import Qt.labs.folderlistmodel 2.1
//import "../api/utils.js"
Item {
    id: element


    property string soundfolder: "file:///home/kovax/Music"
    property bool playing: false
    //property alias playMusic

    Audio {
                id: playMusic
                autoPlay: true
                autoLoad: true
                //source: currently selected file in TreeView
    }
    ListView {
        id: list
        anchors.fill: parent

        model: folderModel
        onCurrentIndexChanged: {
            // This will handle changing playlist with all possible selection methods
            playMusic.source = folderModel.get(currentIndex, "fileURL")
        }
        FolderListModel {
            id: folderModel
            folder: "file:///home/kovax/Music"
            showDirs: false
            nameFilters: ["*.mp3"]
        }
        delegate: Component {
            Item {
                width: parent.width
                height: 40
                Column {
                    Text { text: fileName }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        list.currentIndex = index
                    }
                }
            }
        }
        highlight: Rectangle {
            color: 'grey'
        }
        focus: true
    }

}


