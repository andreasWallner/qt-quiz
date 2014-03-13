import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1

ColumnLayout {
    signal correctAnswerClicked
    signal wrongAnswerClicked

    property QtObject question: null

    Timer {
        id: correctAnswerClickedDelay
        interval: 1000
        onTriggered: correctAnswerClicked()
    }

    Timer {
        id: wrongAnswerClickedDelay
        interval: 1000
        onTriggered: wrongAnswerClicked()
    }

    Label {
        color: "#ffffff"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 100

        text: question.text
        wrapMode: Text.WordWrap
        font.pointSize: 14
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 200

        height: 302
        spacing: 10

        Repeater {
            id: answerRepeater
            model: question.answers
            AnswerButton {
                text: modelData
                onClicked: {
                    for(var i = 0; i < parent.count; ++i)
                        parent.itemAt(i).enabled = false

                    if(index === question.correctAnswerIndex) {
                        correctAnswerClickedDelay.start()
                        state = "RIGHT"
                    }
                    else {
                        wrongAnswerClickedDelay.start()
                        state = "WRONG"
                    }

                        console.log("clicked " + index)
                }
            }
        }
    }
}
