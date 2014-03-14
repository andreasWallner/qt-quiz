import QtQuick 2.0

Rectangle {
    id: container

    property string text: "unset"
    property color textcolor: "#555"
    property alias font : buttonLabel.font
    property bool enabled : true

    onEnabledChanged: console.log('changed')

    signal clicked

    implicitWidth: measureText.width + 40
    implicitHeight: measureText.height + 5

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
        text: container.text

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap

        width: container.width
        height: container.height
    }

    Text {
        id: measureText
        text: container.text
        visible: false
        font: buttonLabel.font
    }
}
