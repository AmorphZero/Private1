import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Rectangle and text")

    Item{
        id: root
        anchors.fill: parent // Занимает всё доступное пространство окна

        Rectangle {
            id: rect_red
            anchors.centerIn: parent
            width: parent.width/3; height: parent.height/3
            color: "cyan"

            Text{
            id: text_1
            anchors.centerIn: parent
            text: "ALL IN"
            font.bold:true
            font.italic: true
            }
        }
    }
}
