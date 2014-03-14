import QtQuick 2.0

Item {
    id: container

    property string text : "unset"
    property string buttontext : "unset"

    signal done

    Column {
        id: col
        anchors.centerIn: parent

        width: parent.width

        spacing: 100

        Text {
            text: container.text
            font.pointSize: 30
            color: "white"

            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap

            width: parent.width
            anchors.leftMargin: 40
            anchors.rightMargin: 40
        }

        Button {
            text: container.buttontext
            onClicked: container.done()
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
