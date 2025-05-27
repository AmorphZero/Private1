import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Task_for_Layout"

    property int selectedButtonIndex: -1  // -1 означает, что кнопка не выбрана

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Header
        Rectangle {
            id: headerRect
            color: "#D3D3D3"
            Layout.fillWidth: true
            height: 40

            Text {
                id: headerText
                anchors.centerIn: parent
                text: "Header"
                font.pixelSize: 16
            }
        }

        // Content
        Rectangle {
            id: contentRect
            color: "white"
            border.color: "gray"
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: contentText
                anchors.centerIn: parent
                text: "Content"
                color: "black"
                font.pixelSize: 14
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        // Footer с прямоугольниками
        RowLayout {
            Layout.fillWidth: true
            height: 70
            spacing: 0
            anchors.margins: 3

            // Прямоугольник 1
            Rectangle {
                id: rect1
                color: "#D3D3D3"
                Layout.fillWidth: true
                height: 70
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 0 ? 1 : 0.4

                Text {
                    anchors.centerIn: parent
                    text: "1"
                    font.pixelSize: 16
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        selectedButtonIndex = 0;
                        headerText.text = "Нажат прямоугольник 1";
                        contentText.text = "Вы выбрали прямоугольник 1";
                    }
                }
            }

            // Прямоугольник 2
            Rectangle {
                id: rect2
                color: "#D3D3D3"
                Layout.fillWidth: true
                height: 70
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 1 ? 1 : 0.4

                Text {
                    anchors.centerIn: parent
                    text: "2"
                    font.pixelSize: 16
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        selectedButtonIndex = 1;
                        headerText.text = "Нажат прямоугольник 2";
                        contentText.text = "Вы выбрали прямоугольник 2";
                    }
                }
            }

            // Прямоугольник 3
            Rectangle {
                id: rect3
                color: "#D3D3D3"
                Layout.fillWidth: true
                height: 70
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 2 ? 1 : 0.4

                Text {
                    anchors.centerIn: parent
                    text: "3"
                    font.pixelSize: 16
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        selectedButtonIndex = 2;
                        headerText.text = "Нажат прямоугольник 3";
                        contentText.text = "Вы выбрали прямоугольник 3";
                    }
                }
            }
        }
    }
}
