import QtQuick 2.0

Rectangle {
    id: container

    property string text: "unset"
    property color color: "white"
    property color textcolor: "black"
    property font font

    signal clicked

    width: buttonLabel.width + 20
    height: buttonLabel.height + 5

    border {
        width: 1
        color: "white"
    }
    smooth: true

    MouseArea {
        anchors.fill: parent
        onClicked: container.clicked();
    }

    Text {
        anchors.centerIn: container
        color: textcolor
        font: font
    }
}
