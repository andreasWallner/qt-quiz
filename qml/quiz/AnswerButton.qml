import QtQuick 2.0
import QtQuick.Layouts 1.1

Button {
    id: button
    height: 100
    Layout.fillHeight: true
    Layout.fillWidth: true
    state: "NORMAL"

    text: "unset"

    color: "#D4E3EE"

    states: [
        State {
            name: "NORMAL";
            PropertyChanges {
                target: button;
                color: "#D4E3EE"
            }
        },
        State {
            name: "WRONG"
            PropertyChanges {
                target: button
                color: "#ff4848"
            }
        },
        State {
            name: "RIGHT"
            PropertyChanges {
                target: button
                color: "#00d200"
            }
        }
    ]

    transitions: Transition {
        ColorAnimation { target: button.color; duration: 150 }
    }
}
