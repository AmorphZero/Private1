import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Page {
    id: pageYellow
    property StackView stackView

    title: "Желтая страница"
    background: Rectangle { color: "yellow" }

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
                text: "Желтая страница"
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
            onClicked: stackView.push(Qt.resolvedUrl("Page_red.qml"), { stackView: stackView })
        }

        Button {
            text: "Перейти на зеленую"
            onClicked: stackView.push(Qt.resolvedUrl("Page_green.qml"), { stackView: stackView })
        }
    }
}
