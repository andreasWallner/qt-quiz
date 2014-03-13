import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button {
    id: button
    height: 100
    Layout.fillHeight: true
    Layout.fillWidth: true
    state: "NORMAL"

    text: "unset"

    property color bgcolor: "#D4E3EE"

    style: ButtonStyle {
        id: s
        background: Rectangle {
            id: rec
            anchors.fill: parent
            border.width: control.activeFocus ? 2 : 1
            border.color: "white"
            color: bgcolor

            Text {
                color: "white"
                text: button.text
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 14
                anchors.fill:parent
            }
        }
        label: Item {}
    }

    states: [
        State {
            name: "NORMAL";
            PropertyChanges { target: bgcolor = "#D4E3EE" }
        },
        State {
            name: "WRONG"
            PropertyChanges { target: bgcolor = "red" }
        },
        State {
            name: "RIGHT"
            PropertyChanges { target: bgcolor = "green" }
        }
    ]

    transitions: Transition {
        ColorAnimation { target: bgcolor; duration: 1000 }
    }
}
