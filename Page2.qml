import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Item {
    id: page
    anchors.fill: parent

    property int selectedButtonIndex: -1

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Основное содержимое слева
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            ToolBar {
                Layout.fillWidth: true
                height: 40
                Label {
                    id: headerLabel
                    text: selectedButtonIndex === -1 ? "Header" : "Нажата кнопка " + (selectedButtonIndex + 1)
                    font.pixelSize: 16
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                color: "white"
                border.color: "gray"
                Layout.fillWidth: true
                Layout.fillHeight: true

                Label {
                    anchors.centerIn: parent
                    text: selectedButtonIndex === -1 ? "Content" : "Вы нажали кнопку " + (selectedButtonIndex + 1)
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Кнопки справа
        ColumnLayout {
            width: 100
            spacing: 10
            Button {
                text: "1"
                Layout.fillWidth: true
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 0 ? 1 : 0.4
                onClicked: page.selectedButtonIndex = 0
            }
            Button {
                text: "2"
                Layout.fillWidth: true
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 1 ? 1 : 0.4
                onClicked: page.selectedButtonIndex = 1
            }
            Button {
                text: "3"
                Layout.fillWidth: true
                opacity: selectedButtonIndex === -1 || selectedButtonIndex === 2 ? 1 : 0.4
                onClicked: page.selectedButtonIndex = 2
            }
        }
    }
}
