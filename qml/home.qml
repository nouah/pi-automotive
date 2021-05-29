import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "composonts"
import "outils/clock"
import "player/soundplayer"
import Qt.labs.folderlistmodel 2.1
//import "../usr/shar/pictures"

PageBackground {

    id: pageBackground
    color: "#00000000"

   // titre: folderModel.folder;
    SoundPlayer{
        x: 368
        state: "miniplay"
        id:miniplay
        width: 334
        height: 40
        opacity: 0.7
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        onXChanged:  settingmain.miniplayx=miniplay.x
        onYChanged: settingmain.miniplayy=miniplay.y
//        MouseArea{
//        anchors.fill: parent
//        drag.target: parent

//        }
    }

    Analogclock{
        x: settingmain.clockx
        y: settingmain.clocky
        width: 180
        height: 180
        visible: settingmain.switchshowclockhomevalue



}
    Flickable {
        id: flickable
        y: 350
        height: 130
        contentHeight: 200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 120
        anchors.rightMargin: 0
        anchors.right: parent.right
        interactive: true
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        //flickableDirection: Flickable.AutoFlickDirection
        contentWidth: rowlay.implicitWidth
        //contentHeight: rowlay.implicitHeight
        flickableDirection: Flickable.HorizontalFlick



        RowLayout {
            id:rowlay
            width: 700
            height: 113
            clip: true
            rotation: 0
            spacing: 20
            BadgeApp{
                id:btnmusic
                width: 100
                badgeabel:"music"
                imagesource: "qrc:/usr/shar/pictures/music.jpg"

                MouseArea {
                    width: 100
                    anchors.fill: parent
                    onClicked: mainLoader.source= "qrc:/qml/player/soundplayer/SoundPlayer.qml"
                }

            }

            BadgeApp{
                id:movie
                width: 100
                badgeabel:"movie"
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("movie clicked!")

                }

            }

            BadgeApp {
                id:bluetooth
                width: 100
                badgeabel: "bluetooth"
                imagesource: "qrc:/usr/shar/pictures/bluetooh.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked:mainLoader.source= "qrc:/qml/bluetooth/scanner.qml"
                }
            }

            BadgeApp {
                id:radio
                width: 100
                badgeabel: "Alarm"
                imagesource: "qrc:/usr/shar/pictures/alarm.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked:mainLoader.source= "qrc:/qml/outils/alarms/Alarm.qml"
                }
            }

            BadgeApp {
                width: 100

                badgeabel: "music"
                imagesource: "qrc:/usr/shar/pictures/music.jpg"

                MouseArea {
                    anchors.fill: parent
                }
            }

            BadgeApp {
                width: 100

                badgeabel: "movie"
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"

                MouseArea {
                    anchors.fill: parent
                }
            }
            BadgeApp {
                width: 100

                badgeabel: "movie"
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"

                MouseArea {
                    anchors.fill: parent
                }
            }

            BadgeApp {
                width: 100
                badgeabel: "movie"
                MouseArea {
                    anchors.fill: parent
                }
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"
            }

            BadgeApp {
                width: 100
                badgeabel: "movie"
                MouseArea {
                    anchors.fill: parent
                }
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"
            }

            BadgeApp {
                width: 100
                badgeabel: "movie"
                MouseArea {
                    anchors.fill: parent
                }
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"
            }

            BadgeApp {
                width: 100
                clip: false
                badgeabel: "movie"
                MouseArea {
                    anchors.fill: parent
                }
                imagesource: "qrc:/usr/shar/pictures/movie.jpg"
            }
        }
        ScrollBar.horizontal:ScrollBar { }
    }
}

























/*##^## Designer {
    D{i:1;anchors_y:38}D{i:2;anchors_height:200}
}
 ##^##*/
