import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property bool isEditing: false
    property int noteIndex: -1
    property color noteColor: appWindow.noteColors[0]
    property int selectedColorIndex: 0

    background: Rectangle { color: appWindow.backgroundColor }

    header: ToolBar {
        height: 56
        background: Rectangle { color: appWindow.primaryColor }

        Button {
            text: "Назад"
            font.pixelSize: 16
            flat: true
            contentItem: Text {
                text: parent.text
                color: "white"
                font: parent.font
            }
            anchors.verticalCenter: parent.verticalCenter
            onClicked: stackView.pop()
        }

        Label {
            text: isEditing ? "Редактировать" : "Новая заметка"
            color: "white"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        TextField {
            id: titleField
            placeholderText: "Заголовок заметки"
            Layout.fillWidth: true
            font.pixelSize: 18
            background: Rectangle {
                radius: 10
                color: appWindow.cardColor
                border.color: "#e0e0e0"
            }
        }

        TextArea {
            id: contentField
            placeholderText: "Текст заметки..."
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.pixelSize: 16
            wrapMode: Text.Wrap
            background: Rectangle {
                radius: 10
                color: appWindow.cardColor
                border.color: "#e0e0e0"
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 10

            Label {
                text: "Цвет заметки:"
                font.pixelSize: 16
                color: appWindow.textColor
            }

            Flow {
                Layout.fillWidth: true
                spacing: 10
                layoutDirection: Qt.LeftToRight

                Repeater {
                    model: appWindow.noteColors
                    delegate: Rectangle {
                        width: 44; height: 44; radius: 22
                        color: modelData
                        border.width: index === selectedColorIndex ? 3 : 0
                        border.color: "#333"

                        Rectangle {
                            anchors.centerIn: parent
                            width: 30; height: 30; radius: 15
                            color: "transparent"
                            border.width: index === selectedColorIndex ? 2 : 0
                            border.color: "white"
                            visible: index === selectedColorIndex
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                noteColor = modelData
                                selectedColorIndex = index
                            }
                        }
                    }
                }
            }
        }

        CheckBox {
            id: pinCheckbox
            text: "Закрепить заметку"
            font.pixelSize: 16
            Layout.fillWidth: true

            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                radius: 5
                border.color: pinCheckbox.checked ? appWindow.primaryColor : "#cccccc"

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 5
                    radius: 3
                    color: pinCheckbox.checked ? appWindow.primaryColor : "transparent"
                }
            }
        }

        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Button {
                text: "Отмена"
                Layout.fillWidth: true
                height: 50
                background: Rectangle {
                    radius: 10
                    color: "#f5f5f5"
                    border.width: 1
                    border.color: "#cccccc"
                }
                contentItem: Text {
                    text: parent.text
                    color: appWindow.textColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 16
                }
                onClicked: stackView.pop()
            }

            Button {
                text: "Сохранить"
                Layout.fillWidth: true
                height: 50
                background: Rectangle {
                    radius: 10
                    color: appWindow.primaryColor
                }
                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 16
                }
                onClicked: saveNote()
            }
        }
    }

    function saveNote() {
        var currentDate = new Date()
        var noteData = {
            title: titleField.text,
            content: contentField.text,
            color: noteColor,
            pinned: pinCheckbox.checked,
            date: isEditing ? notesModel.get(noteIndex).date : currentDate.toLocaleDateString(),
            time: isEditing ? notesModel.get(noteIndex).time : currentDate.toLocaleTimeString(Qt.locale(), "hh:mm")
        }

        if(isEditing && noteIndex >= 0) {
            notesModel.set(noteIndex, noteData)
        } else {
            notesModel.append(noteData)
        }
        stackView.pop()
    }

    Component.onCompleted: {
        if(isEditing && noteIndex >= 0) {
            var note = notesModel.get(noteIndex)
            titleField.text = note.title
            contentField.text = note.content
            noteColor = note.color
            pinCheckbox.checked = note.pinned
            selectedColorIndex = appWindow.noteColors.indexOf(note.color)
        }
    }
}
