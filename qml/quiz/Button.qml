import QtQuick 2.0

Rectangle {
    id: container

    property string text: "unset"
    property color textcolor: "#555"
    property alias font : buttonLabel.font
    property bool enabled : true

    onEnabledChanged: console.log('changed')

    signal clicked

    implicitWidth: buttonLabel.width + 40
    implicitHeight: buttonLabel.height + 5

    color: "#D4E3EE"

    border {
        width: hitbox.containsMouse ? 3 : 1
        color: "white"
    }
    smooth: true

    MouseArea {
        id: hitbox
        anchors.fill: parent
        onClicked: container.enabled ? container.clicked() : null;
        hoverEnabled: true
    }

    Text {
        id: buttonLabel
        anchors.centerIn: container
        text: container.text
        color: container.textcolor
    }
}
