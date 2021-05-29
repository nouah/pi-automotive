import QtQuick 2.0
import "../composonts"
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.3
Item {
    id: name

    Rectangle {
        id: page1
        x: 0
        y: 0
        width: 640
        height: 480
        color: "#ffffff"
    }

    Rectangle {
        id: page2
        x: 0
        y: 0
        width: 640
        height: 480
        color: "#ffffff"
    }

    StackView {
        id: stackView
        x: 89
        y: 397
        width: 200
        height: 200
    }
}
