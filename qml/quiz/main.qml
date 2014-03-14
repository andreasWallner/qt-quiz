import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.0

Item {
    id: container
    property int currentQuestionIndex : 0
    property QtObject currentQuestion : null
    property int correctCnt : 0
    property int wrongCnt : 0

    implicitWidth: pageView.implicitWidth
    implicitHeight: pageView.implicitHeight

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.5; color: "#8CB2D2" }
            GradientStop { position: 0.0; color: "#DEE5F0" }
        }
    }

    property Component startPage: NotePage {
        text: "Infineon Quiz"
        buttontext: "STARTEN"
        onDone: {
            container.correctCnt = 0
            container.wrongCnt = 0
            currentQuestionIndex = 0
            pageView.push({item:questionsPage, replace:true})
            currentQuestion = questionList.get(0)
        }
    }

    property Component resultPage: NotePage {
        text: "Resultat: " + container.correctCnt + " von " + (container.correctCnt + container.wrongCnt)
        buttontext: "RESET"

        onDone: {
            pageView.push({item:startPage, replace:true})
        }
    }

    property Component correctionPage: NotePage {
        text: container.currentQuestion.correction
        buttontext: "WEITER"

        onDone: {
            currentQuestionIndex += 1
            if(currentQuestionIndex >= questionList.count) {
                pageView.push({item:resultPage, replace:true})
            }
            else {
                currentQuestion = questionList.get(currentQuestionIndex)
                pageView.push({item:questionsPage, replace:true})
            }
        }
    }

    property Component questionsPage: QuestionPage {
        question: currentQuestion
        onCorrectAnswerClicked: {
            container.correctCnt += 1
            currentQuestionIndex += 1

            if(currentQuestionIndex >= questionList.count)
                pageView.push({item:resultPage, replace:true})
            else
                currentQuestion = questionList.get(currentQuestionIndex)

            console.log("correct " + container.correctCnt)
            console.log("wrong " + container.wrongCnt)
        }
        onWrongAnswerClicked: {
            container.wrongCnt += 1

            pageView.push({item:correctionPage, replace:true})

            console.log("correct " + container.correctCnt)
            console.log("wrong " + container.wrongCnt)
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
            correction: "you did click on a button, didn't you?"
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
            correction: "you don't want to know when this was written"
            correctAnswerIndex: 1
            answers: [
                ListElement { text: "no" },
                ListElement { text: "yes" }
            ]
        }
    }

    Component.onCompleted: {
        currentQuestion = questionList.get(0)
    }
}

