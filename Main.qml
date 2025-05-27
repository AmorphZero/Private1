import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 360
    height: 600
    visible: true
    title: "Task_for_ListView_Model"

    // Модель сообщений
    ListModel {
        id: messageModel
        ListElement {
            text: "Privet!!!!"
            time: "22:02"
        }
        ListElement {
            text: "New message"
            time: "22:03"
        }
        ListElement {
            text: "Have a nice day)"
            time: "22:03"
        }
        ListElement {
            text: "or a night..."
            time: "22:03"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Заголовок
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "#4CAF50"
            anchors.bottomMargin: 10

            Text {
                anchors.centerIn: parent
                text: "Messages"
                font.bold: true
                font.pixelSize: 20
                color: "white"
            }
        }

        // Список сообщений
        ListView {
            id: messageListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: messageModel
            spacing: 10
            delegate: Rectangle {
                width: messageListView.width * 0.9
                height: messageColumn.height + 20
                color: "#e9f5e9"
                radius: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    id: messageColumn
                    width: parent.width - 20
                    anchors.centerIn: parent
                    spacing: 5

                    Text {
                        width: parent.width
                        text: model.text
                        wrapMode: Text.Wrap
                        font.pixelSize: 16
                    }

                    Text {
                        text: model.time
                        color: "#666"
                        font.pixelSize: 12
                        anchors.right: parent.right
                    }
                }
            }
        }

        // Панель ввода сообщения
        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#f5f5f5"
            border.color: "#ddd"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 5

                TextField {
                    id: messageInput
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    placeholderText: "Write a message..."
                    font.pixelSize: 16
                    background: Rectangle {
                        radius: 20
                        border.color: "#ddd"
                    }
                }

                Button {
                    text: "Send"
                    Layout.preferredWidth: 80
                    Layout.fillHeight: true
                    font.pixelSize: 16
                    onClicked: {
                        if (messageInput.text.trim() !== "") {
                            // Добавляем новое сообщение
                            messageModel.append({
                                text: messageInput.text,
                                time: new Date().toLocaleTimeString(Qt.locale(), "hh:mm")
                            })
                            messageInput.text = ""
                            messageListView.positionViewAtEnd()
                        }
                    }
                    background: Rectangle {
                        radius: 20
                        color: "#4CAF50"
                    }
                    contentItem: Text {
                        text: parent.text
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    // Автопрокрутка при добавлении нового сообщения
    Connections {
        target: messageModel
        function onRowsInserted() {
            messageListView.positionViewAtEnd()
        }
    }
}
