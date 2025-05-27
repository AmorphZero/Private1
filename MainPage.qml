import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property bool isEditing: false
    property int noteIndex: -1
    property color noteColor: appWindow.noteColors[0]
    property int selectedColorIndex: 0  // Новое свойство для отслеживания выбранного цвета

    header: ToolBar {
        height: 56
        background: Rectangle { color: appWindow.primaryColor }

        Label {
            text: "Мои заметки"
            color: "white"
            font.pixelSize: 20
            font.bold: true
            anchors.centerIn: parent
        }
    }

    ListView {
        id: notesList
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: addButton.top
            margins: 10
        }
        spacing: 10
        clip: true
        model: notesModel

        delegate: Rectangle {
            width: parent.width
            height: 80
            radius: 10
            color: model.color

            Column {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5

                Text {
                    text: model.title
                    font.bold: true
                    font.pixelSize: 16
                    width: parent.width
                    elide: Text.ElideRight
                }

                Text {
                    text: model.content
                    width: parent.width
                    elide: Text.ElideRight
                    maximumLineCount: 1
                    font.pixelSize: 14
                }

                Row {
                    spacing: 10
                    anchors.right: parent.right
                    Text {
                        text: model.date
                        font.pixelSize: 12
                        color: "#666"
                    }
                    Text {
                        text: model.time
                        font.pixelSize: 12
                        color: "#666"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: stackView.push("ViewNotePage.qml", {noteIndex: index})
            }
        }

        Label {
            anchors.centerIn: parent
            text: "Нет заметок\nНо вы всегда можете 'Добавить заметку'"
            visible: notesModel.count === 0
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
            color: "#666"
        }
    }

    RoundButton {
        id: addButton
        text: "Добавить заметку"
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: 20
        }
        width: 250
        height: 60
        radius: 30
        font.pixelSize: 24
        palette.button: appWindow.primaryColor
        palette.buttonText: "white"

        onClicked: {
            stackView.push("AddEditNotePage.qml", {isEditing: false})
        }
    }

    Connections {
        target: stackView
        function onCurrentItemChanged() {
            if(stackView.currentItem === mainPage) {
                refreshNotes()
            }
        }
    }
    Component.onCompleted: {
        if(isEditing && noteIndex >= 0) {
            var note = notesModel.get(noteIndex)
            titleField.text = note.title
            contentField.text = note.content
            noteColor = note.color
            pinCheckbox.checked = note.pinned

            // Устанавливаем правильный индекс выбранного цвета
            selectedColorIndex = appWindow.noteColors.indexOf(note.color)
            if(selectedColorIndex === -1) selectedColorIndex = 0
        }
    }
}
