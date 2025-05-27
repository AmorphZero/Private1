import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Task_for_Layout"

    property int selectedButtonIndex: -1

    // Основной вертикальный layout
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Header
        Rectangle {
            color: "#D3D3D3"  // светло-серый фон
            Layout.fillWidth: true
            height: 40

            Text {
                id: headerText
                anchors.centerIn: parent
                text: "Header"
                font.pixelSize: 16
            }
        }

        // Контент с рамкой, занимает всё свободное место
        Rectangle {
            id: contentRect
            color: "white"
            border.color: "gray"
            border.width: 1
            radius: 2
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: contentText
                anchors.centerIn: parent
                text: "Some content"
                font.pixelSize: 14
                color: "black"
            }
        }

        // Футер с тремя равными кнопками
        Rectangle {
            color: "#D3D3D3"
            Layout.fillWidth: true
            height: 50

            RowLayout {
                anchors.fill: parent
                anchors.margins: 1
                spacing: 0

                Button {
                    text: "Item 1"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        headerText.text = "Item 1 selected"
                        contentText.text = "You clicked Item 1"
                        selectedButtonIndex = 0
                    }
                    opacity: selectedButtonIndex === -1 || selectedButtonIndex === 0 ? 1 : 0.5
                }
                Button {
                    text: "Item 2"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        headerText.text = "Item 2 selected"
                        contentText.text = "You clicked Item 2"
                        selectedButtonIndex = 1
                    }
                    opacity: selectedButtonIndex === -1 || selectedButtonIndex === 1 ? 1 : 0.5
                }
                Button {
                    text: "Item 3"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onClicked: {
                        headerText.text = "Item 3 selected"
                        contentText.text = "You clicked Item 3"
                        selectedButtonIndex = 2
                    }
                    opacity: selectedButtonIndex === -1 || selectedButtonIndex === 2 ? 1 : 0.5
                }
            }
        }
    }
}
