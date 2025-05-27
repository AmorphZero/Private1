import QtQuick 2.15
import QtQuick.Window 2.15

Window {
width: 640; height: 480; visible: true
title: qsTr("Hello World")
id:win

Item{
    id: root
    anchors.fill: parent

    Rectangle {
        id:rect_top
        color: "light gray"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right:parent.right
        height:100

        Text {
        id: txt
        text: "Header"
        font.pixelSize: 25
        color: "black"
        anchors.centerIn: rect_top
        }
    }
    Rectangle {
        id:rect_mid
        color: "white"
        border.color: "light gray"
        anchors.top: rect_top.bottom
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: rect_bot.top
        anchors.margins:10

        Text {
        id: txt2
        text: "Content"
        font.pixelSize: 25
        color: "black"
        anchors.centerIn: rect_mid
        }
    }
    Rectangle {
        id:rect_bot
        color: "whitesmoke"
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        height:100

        Rectangle{
            id:btm1
            height: 100
            width: parent.width/3
            color: "gainsboro"
            border.color: "light gray"
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            Text {
            id: txt3
            text: "1"
            font.pixelSize: 25
            color: "black"
            anchors.centerIn: btm1
            }
        }
        Rectangle{
            id:btm2
            height: 100
            width: parent.width/3
            color: "gainsboro"
            border.color: "light gray"
            anchors.bottom: parent.bottom
            anchors.left: btm1.right
            anchors.right: btm3.left
            anchors.leftMargin: 5
            anchors.rightMargin: 5

            Text {
            id: txt4
            text: "2"
            font.pixelSize: 25
            color: "black"
            anchors.centerIn: btm2
            }
        }
        Rectangle{
            id:btm3
            height: 100
            width: parent.width/3
            color: "gainsboro"
            border.color: "light gray"
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            Text {
            id: txt5
            text: "3"
            font.pixelSize: 25
            color: "black"
            anchors.centerIn: btm3
            }
        }
    }
}
}
