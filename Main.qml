import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Task_for_Layout"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            color: "#D3D3D3" // светло-серый фон
            Layout.fillWidth: true
            height: 50

            Text {
                anchors.centerIn: parent
                text: "Header"
                font.pixelSize: 16
            }
        }

        Rectangle {
            color: "white"
            border.color: "gray"
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                anchors.centerIn: parent
                text: "Content"
                color: "black"
                font.pixelSize: 14
            }
        }

        RowLayout {
            Layout.fillWidth: true
            height: 70
            spacing: 0

            Button {
                text: "1"
                Layout.fillWidth: true
                height: 70
            }
            Button {
                text: "2"
                Layout.fillWidth: true
                height: 70
            }
            Button {
                text: "3"
                Layout.fillWidth: true
                height: 70
            }
        }

    }
}
