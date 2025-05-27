import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640; height: 480; visible: true
    title: qsTr("Hello World")
    id:win
    Item{
        id: root
        anchors.fill: parent

        Rectangle{
            id:rect
            width:200
            height:200
            color:"cyan"
            anchors.centerIn: parent
            anchors.margins: 1
        }

            Rectangle{
                id:rect1
                width:100
                height:100
                color:"orange"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }}}
