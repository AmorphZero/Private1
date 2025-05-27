import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property int noteIndex: -1

    background: Rectangle { color: appWindow.backgroundColor }

    header: ToolBar {
        height: 56
        background: Rectangle { color: appWindow.primaryColor }

        RowLayout {
            anchors.fill: parent
            spacing: 10

            // Текстовая кнопка "Назад" (всегда видимая)
            Button {
                text: "Назад"
                font.pixelSize: 16
                flat: true
                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font: parent.font
                }
                background: Rectangle {
                    color: "transparent"
                }
                onClicked: stackView.pop()
            }

            Item { Layout.fillWidth: true } // Распорка

            Label {
                text: "Просмотр заметки"
                color: "white"
                font.pixelSize: 20
            }

            Item { Layout.fillWidth: true } // Распорка
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        Text {
            text: notesModel.get(noteIndex).title
            font.bold: true
            font.pixelSize: 22
            color: appWindow.textColor
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextArea {
                text: notesModel.get(noteIndex).content
                readOnly: true
                wrapMode: Text.Wrap
                font.pixelSize: 16
                color: appWindow.textColor
                background: null
            }
        }

        Row {
            spacing: 15
            Layout.alignment: Qt.AlignRight

            Text {
                text: notesModel.get(noteIndex).date
                font.pixelSize: 14
                color: appWindow.secondaryTextColor
            }

            Text {
                text: notesModel.get(noteIndex).time
                font.pixelSize: 14
                color: appWindow.secondaryTextColor
            }
        }
    }

    // Контейнер для кнопок действий
    ColumnLayout {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        spacing: 10

        // Кнопка редактирования
        Button {
            text: "Редактировать"
            width: parent.width
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

            onClicked: {
                stackView.push("AddEditNotePage.qml", {
                    isEditing: true,
                    noteIndex: noteIndex
                })
            }
        }

        // Кнопка удаления
        Button {
            text: "Удалить заметку"
            width: parent.width
            height: 50

            background: Rectangle {
                radius: 10
                color: "#ff4444"
            }

            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
            }

            onClicked: deleteConfirmDialog.open()
        }
    }

    // Диалог подтверждения удаления
    Dialog {
        id: deleteConfirmDialog
        title: "Удаление заметки"
        anchors.centerIn: parent
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        Label {
            text: "Вы точно хотите удалить эту заметку?"
            font.pixelSize: 16
        }

        onAccepted: {
            notesModel.remove(noteIndex)
            stackView.pop()
        }
    }
}
