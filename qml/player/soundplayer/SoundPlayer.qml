import QtQuick 2.12
import QtMultimedia 5.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.5
import "qrc:/qml/javascript/utils.js" as Jvutils
import QtQuick.Layouts 1.0
import "Api"



Item {
    id: soubdplay
    Material.theme: Material.Dark
    Material.accent: Material.DeepOrange
    property real avolume:slidervolume.value
    property string asoundtitle:""
    property string  aalbumtitle :""



//    GetArtist{
//        id:art
//        artist:playMusic.metaData.albumArtist
//    }


    Rectangle{
        id:mainsound
        color: "#000000"
        anchors.rightMargin: 200
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onPressed: {

                if (columcontrol.enabled===true){
                    console.log("masquercontrol");
                    mouse.accepted = false;
                    masquercontrol.start()
                    columcontrol.enabled=false
                    slidervolume.enabled=false
                    eqalizer.enabled=false
                }else {
                    console.log("affichercontrol")
                    mouse.accepted = true
                    affichercontrol.start()
                    columcontrol.enabled=true
                    slidervolume.enabled=true
                    eqalizer.enabled=true

                }
            }

        }
        SequentialAnimation {
            id: masquercontrol
            running: false
            NumberAnimation { target:columcontrol; property: "opacity"; to: 0; duration:500}
            NumberAnimation { target: slidervolume; property: "opacity"; to: 0; duration:500}
            NumberAnimation { target: eqalizer; property: "opacity"; to: 0; duration:500}

        }
        SequentialAnimation {
            id: affichercontrol
            running: false
            NumberAnimation { target: columcontrol; property: "opacity"; to: 1; duration: 200}
            NumberAnimation { target: slidervolume; property: "opacity"; to: 1; duration: 200}
            NumberAnimation { target: eqalizer; property: "opacity"; to: 1; duration: 200}
        }

        RowLayout {
            id: eqalizer
            x: 50
            y: 197
            width: 287
            height: 157
            anchors.horizontalCenterOffset: 7
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.maximumHeight: 170

            ColumnLayout {
                Label {
                    text: "12 dB"
                    Layout.fillHeight: true
                }
                Label {
                    text: "6 dB"
                    Layout.fillHeight: true
                }
                Label {
                    text: "0 dB"
                    Layout.fillHeight: true
                }
                Label {
                    text: "-6 dB"
                    Layout.fillHeight: true
                }
                Label {
                    text: "-12 dB"
                    Layout.fillHeight: true
                }
            }

            Repeater {
                model: 7

                Slider {
                    value: Math.random()
                    orientation: Qt.Vertical

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

//        Image {
//            id: artistpic
//            x: 161
//            y: 63
//            width: 100
//            height: 100
//            source: art.lastArtist.imageExl

//        }
        Text {
            id: artistname
            x: 34
            y: 42
            color: "#ffffff"
            text: playMusic.metaData.albumArtist +"\n"+playMusic.metaData.albumTitle
            font.pixelSize: 12
        }








        Slider {
            // transform: Scale {yScale: hideValue}
            id: slidervolume
            x: 368
            width: 56
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 148
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 126
            orientation: Qt.Vertical
            to: 1.0
            from: 0
            stepSize: 0.05
            value:playMusic.volume
            ToolTip {
                parent: slidervolume.handle
                visible: slidervolume.pressed
                text: slidervolume.value.toFixed(1)
            }
            onValueChanged:  {
                //if (!pressed)
                playMusic.volume=slidervolume.value
            }


        }


        ColumnLayout{
            id: columcontrol
            y: 375
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0

            Row {
                id: rowtracker
               // x: 0
                height: 50
                // anchors.horizontalCenter: parent.horizontalCenter
                //                anchors.bottom: parent.bottom
                //                anchors.bottomMargin: 50
                 Layout.fillWidth: true

                Slider {
                    id: slidertracker
                    width: 360
                    height: 50
                   // anchors.horizontalCenter: parent.horizontalCenter
                   // anchors.verticalCenter: parent.verticalCenter
                    to: playMusic.duration
                    value: playMusic.position
                    from: 0.00
                    stepSize: 1000
                    ToolTip {
                        parent: slidertracker.handle
                        visible: slidertracker.pressed
                        text: Jvutils.msToTime(playMusic.position)
                    }
                    onValueChanged:   {
                        // if (!pressed)
                        playMusic.seek(value)
                    }

                }
            }

            Row {
                id: rowcontrol
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                // anchors.horizontalCenter: parent.horizontalCenter


                Layout.fillWidth: true

                spacing: 0

                Button {
                    id: btnprev
                    text: qsTr("Button")
                    anchors.verticalCenter: parent.verticalCenter
                    checkable: false
                    display: AbstractButton.IconOnly
                    autoExclusive: false
                    flat: true
                    icon.source: "qrc:/icons/svg/step-backward.svg"
                    onClicked: {

                        listsoundfolder.currentIndex -= 1


                    }

                }




                Button {
                    id: seekleft

                    anchors.verticalCenter: parent.verticalCenter
                    display: AbstractButton.IconOnly
                    checkable: false
                    autoExclusive: false
                    flat: true
                    icon.source: "qrc:/icons/svg/arrowheads-pointing-to-the-left.svg"
                    onClicked:  {

                        playMusic.seek(playMusic.position-1000)

                    }
                }





                Button {
                    id: btnplay
                    text: qsTr("play")
                    anchors.verticalCenter: parent.verticalCenter
                    display: AbstractButton.IconOnly
                    checkable: false
                    autoExclusive: false
                    flat: true
                    icon.source: if (playMusic.playbackState ===Audio.PlayingState)
                                     "qrc:/icons/svg/pause-symbol.svg"
                                 else
                                     "qrc:/icons/svg/play-button.svg"

                    onClicked:  {
                        if (playMusic.playbackState ===Audio.PlayingState){
                            playMusic.pause();

                        }else{
                            playMusic.play();

                        }
                    }
                }





                Button {
                    id: seeklright
                    text: qsTr("Button")
                    anchors.verticalCenter: parent.verticalCenter
                    display: AbstractButton.IconOnly
                    checkable: false
                    autoExclusive: false
                    flat: true
                    icon.source: "qrc:/icons/svg/arrowheads-pointing-to-the-right.svg"
                    onClicked:  {

                        playMusic.seek(playMusic.position+1000)

                    }
                }





                Button {
                    id: btnnext
                    text: qsTr("Button")
                    anchors.verticalCenter: parent.verticalCenter
                    display: AbstractButton.IconOnly
                    autoExclusive: false
                    checkable: false
                    flat: true
                    icon.source: "qrc:/icons/svg/step-forward.svg"
                    onClicked: {
                        listsoundfolder.currentIndex += 1

                    }
                }




                Button {
                    id: btnmuet
                    y: 1
                    anchors.verticalCenter: parent.verticalCenter
                    display: AbstractButton.IconOnly
                    flat: true
                    icon.source:playMusic.muted===false?"qrc:/icons/svg/volume-up-interface-symbol.svg": "qrc:/icons/svg/volume-off.svg"
                    checkable: false
                    onClicked:  {

                        if( playMusic.muted===false){
                            //muted=playMusic.muted=true
                            amuted=true
                            icon.source="qrc:/icons/svg/volume-off.svg"
                        }
                        else{
                            //playMusic.muted=false
                            amuted=false
                            icon.source="qrc:/icons/svg/volume-up-interface-symbol.svg"
                        }

                    }
                }



                Text {
                    id: soundduration
                    width: 50
                    color: "#f7f7f7"
                    text: Jvutils.msToTime(playMusic.duration-playMusic.position)
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.verticalCenterOffset: 0
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

        }




    }

    Rectangle{
        id:soundliste
        x: 440
        width: 200
        color: "#000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        Layout.preferredWidth: 200


        ListView {
            id: listsoundfolder
            keyNavigationWraps: false
            spacing: 0
            anchors.bottomMargin: 0
            clip: true
            anchors.fill: parent
            //focus: true
            model: folderModel
            // property int checkedIndex: -1
            highlightResizeDuration: 0

            // header: folderModel.get(currentIndex, "fileBaseName")

            onCurrentIndexChanged: {
                // list.currentIndex +=1
                 console.log("fileURL=="+folderModel.get(currentIndex, "fileURL"));
                 playMusic.source = folderModel.get(currentIndex, "fileURL");





            }
            Connections {
                target: mtools
                onSendToQml: {

                   // folderModel.folder = usbfolder // Set the counter to the text label

                     if (usbfolder==""){
                         playMusic.stop();
                         playMusic.source ="";
                         listsoundfolder.model=null;
                         console.log("QMl  ListView usbfolder=nullstr");
                     }else{
                     listsoundfolder.model=folderModel
                     }

                    folderModel.submit();
                }
            }
//Button header: ListView
            header:Button{
                id:parentFold
                height: 100
                width: parent.width
                text: folderModel.folder===folderModel.rootFolder?"empty list":""
                visible: true
                icon.source:folderModel.folder===folderModel.rootFolder?"": "qrc:/icons/svg/reply.svg"
                onClicked: {

                    if (folderModel.folder!==folderModel.rootFolder){
                        folderModel.folder=folderModel.parentFolder

                    }
                }

            }
            delegate: Component {

                Button{
                    width: parent.width
                    height: 100
                    flat: true
                    id:menuButton

                    //folderModel.isFolder(index)?"qrc:/icons/svg/svg/open-folder.svg":"qrc:/icons/svg/music-note-black-symbol.svg"

                    Text {
                        color: "#fdfdfd"
                        anchors.leftMargin:5
                        text: fileName //nom de fichier
                        anchors.verticalCenter: parent.verticalCenter
                        verticalAlignment: Text.AlignVCenter
                                                ColorAnimation {
                                                    from: "white"
                                                    to: "red"
                                                    duration: 200
                                                }
                    }



                    onClicked: {
                        if  (folderModel.isFolder(index)){
                            console.log("isfolder ="+folderModel.get(index,"filePath"));
                            folderModel.folder="file://"+folderModel.get(index,"filePath")

                            console.log("isfolder after folderModel.folder ="+filePath)
                        }else{
                            console.log("isfile ="+filePath)
                            listsoundfolder.currentIndex = index
                            playMusic.source = folderModel.get(listsoundfolder.currentIndex , "fileURL")
                            playMusic.play()

                        }
                    }

                }
            }
            highlight:Button  {
                //color: 'grey'
                checked: true
            }
            focus: true

            ScrollBar.vertical: ScrollBar{
                width: 40
            }

        }

    }

    states: [
        State {
            name: "miniplay"

            PropertyChanges {
                target: listsoundfolder


                visible: false
            }

            PropertyChanges {
                target: seeklright

                visible: false
            }

            PropertyChanges {
                target: slidervolume
                visible: false
            }

            PropertyChanges {
                target: seekleft
                visible: false
            }

            PropertyChanges {
                target: soubdplay
                width: 334
                height: 60
            }

            PropertyChanges {
                target: mainsound
                width: 33
                color: "#00000000"
                anchors.bottomMargin: 0
                anchors.leftMargin: -5
                anchors.topMargin: 0
                anchors.rightMargin: 125
            }

            PropertyChanges {
                target: btnplay
                visible: true
            }

            PropertyChanges {
                target: slidertracker
                visible: false
            }

            PropertyChanges {
                target: soundliste
                width: 75
                anchors.rightMargin: 125
                visible: false
            }

            PropertyChanges {
                target: rowcontrol
                y: 0
                width: 334
                height: 40
                anchors.rightMargin: -128
                anchors.leftMargin: 8
                anchors.horizontalCenterOffset: 68
                anchors.bottomMargin: 0
            }

            PropertyChanges {
                target: eqalizer
                visible: false
            }

            PropertyChanges {
                target: columcontrol
                x: 8
                y: -43
                anchors.horizontalCenterOffset: 93
                anchors.bottomMargin: 0
            }

            PropertyChanges {
                target: artistname
                x: 10
                y: 66
            }
        }
    ]


}








/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:400;anchors_width:200;anchors_x:2;anchors_y:7}
D{i:8;anchors_height:400;anchors_width:200;anchors_x:2;anchors_y:7}D{i:9;anchors_height:400;anchors_width:200;anchors_x:2;anchors_y:7}
D{i:10;anchors_height:400;anchors_width:200;anchors_x:2;anchors_y:7}D{i:13;anchors_height:50;anchors_width:360}
D{i:12;anchors_y:151}D{i:11;anchors_height:400;anchors_width:200;anchors_x:2;anchors_y:372}
}
 ##^##*/
