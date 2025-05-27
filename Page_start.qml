import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Page {
    id: pageStart
    property StackView stackView

    title: "Стартовая страница"
    background: Rectangle { color: "white" }

    header: ToolBar {
        Label {
            text: "Добро пожаловать"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30
        width: parent.width * 0.6

        // Логотип — можно заменить на Image, если есть файл
        Image {
            width: 130; height: 100
            source: "qrc:/light.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Выберите страницу для перехода:"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Красная страница"
            onClicked: stackView.push(Qt.resolvedUrl("Page_red.qml"), { stackView: stackView })
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Зеленая страница"
            onClicked: stackView.push(Qt.resolvedUrl("Page_green.qml"), { stackView: stackView })
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Желтая страница"
            onClicked: stackView.push(Qt.resolvedUrl("Page_yellow.qml"), { stackView: stackView })
        }
    }
}
