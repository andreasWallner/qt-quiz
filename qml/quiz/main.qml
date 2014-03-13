import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

Item {
    property int currentQuestion : 0

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.5; color: "#8CB2D2" }
            GradientStop { position: 0.0; color: "#DEE5F0" }
        }
    }

    property Component startPage: StartPage {
        onStart: {
            questionsPage.question = questionList.get(0)
            pageView.push({item:questionsPage, replace:true})
        }
    }

    property Component questionsPage: QuestionPage {
        onCorrectAnswerClicked: {
            currentQuestion += 1
            if(currentQuestion >= questionList.count)
                console.log("finished")
            else
                question = questionList.get(currentQuestion)
        }
    }

    StackView {
        id: pageView
        anchors.fill: parent
        anchors.margins: 20
        initialItem: startPage
        delegate: StackViewDelegate {
            pushTransition: StackViewTransition {
                function transitionFinished(properties)
                {
                    properties.exitItem.opacity = 1
                }
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: target.width
                    to: 0
                    duration: 500
                    easing.type: Easing.OutSine
                }
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: -target.width
                    duration: 500
                    easing.type: Easing.OutSine
                }
            }
            popTransition: StackViewTransition {
                function transitionFinished(properties)
                {
                    properties.exitItem.opacity = 1
                }
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: -target.width
                    to: 0
                    duration: 500
                    easing.type: Easing.OutSine
                }
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: target.width
                    duration: 500
                    easing.type: Easing.OutSine
                }
            }
            property Component replaceTransition: pushTransition
        }
    }

    ListModel {
        id:questionList

        ListElement {
            text: "can you click a button"
            correctAnswerIndex: 2
            answers: [
                ListElement { text: "no" },
                ListElement { text: "not now" },
                ListElement { text: "yes" },
                ListElement { text: "I don't know" }
            ]
        }
        ListElement {
            text: "is it late?"
            correctAnswerIndex: 1
            answers: [
                ListElement { text: "no" },
                ListElement { text: "yes" }
            ]
        }
    }
}

