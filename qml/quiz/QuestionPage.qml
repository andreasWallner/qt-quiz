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
        font.pointSize: 20
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

                anchors.rightMargin: 50
                anchors.leftMargin: 50

                font.pointSize: 20

                onClicked: {
                    for(var i = 0; i < answerRepeater.count; ++i) {
                        answerRepeater.itemAt(i).enabled = false
                        console.log(i)
                    }

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
