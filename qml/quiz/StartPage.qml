import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Column {
    signal start

    anchors.fill: parent
    spacing:100

    Text {
        id: text1
        text: "Infineon Quiz"
        font.pixelSize: 30
        color: "white"
    }

    Button {
        id: button1
        text: "< STARTEN >"

        anchors.verticalCenter: parent

        style: ButtonStyle {
            id: s
            background: Rectangle {
                id: rec
                anchors.fill: parent
                border.width: control.activeFocus ? 2 : 1
                border.color: "white"
                color: "#D4E3EE"

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

        onClicked: start()
    }

}
