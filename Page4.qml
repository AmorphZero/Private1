import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Item {
    id: page
    anchors.fill: parent

    TabBar {
        id: tabBar
        width: parent.width
        currentIndex: 0

        TabButton { text: "1" }
        TabButton { text: "2" }
        TabButton { text: "3" }
    }

    Rectangle {
        id: contentArea
        anchors.top: tabBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "white"
        border.color: "gray"

        Label {
            anchors.centerIn: parent
            text: "Вы выбрали вкладку " + (tabBar.currentIndex + 1)
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
