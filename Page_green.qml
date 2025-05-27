import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Page {
    id: pageGreen
    title: "Зеленая страница"
    background: Rectangle { color: "green" }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            spacing: 10

            Button {
                text: "Назад"
                enabled: stackView.depth > 1
                onClicked: stackView.pop()
            }

            Label {
                text: "Зеленая страница"
                font.pixelSize: 20
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
            }
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Перейти на красную"
            onClicked: stackView.push(Qt.resolvedUrl("Page_red.qml"))
        }

        Button {
            text: "Перейти на желтую"
            onClicked: stackView.push(Qt.resolvedUrl("Page_yellow.qml"))
        }
    }
}
