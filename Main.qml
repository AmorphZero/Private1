import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Block{
        id: head
        comHeight: 80
        comWidth:80
        comColor: "red"
        anchors.bottom: body.top
        anchors.horizontalCenter: body.horizontalCenter
        anchors.margins:80
    }
    Block{
        id: body
        comColor: "blue"
        comHeight: 120
        comWidth:80
        anchors.centerIn: parent
        anchors.margins:80

        Block{
            id: leg1
            comColor: "purple"
            comHeight: 120
            comWidth:40
            anchors.left: body.left
            anchors.top: body.bottom
            anchors.topMargin: 120
        }
        Block{
            id: leg2
            comColor: "pink"
            comHeight: 120
            comWidth:40
            anchors.right: body.right
            anchors.top: body.bottom
            anchors.topMargin: 120
            anchors.rightMargin: -40
        }
    }
    Block{
        id: arm1
        comColor: "cyan"
        comHeight: 120
        comWidth:40
        anchors.right: body.left
        anchors.top: body.top
        anchors.horizontalCenter: body.horizontalCenter
        anchors.verticalCenter: body.verticalCenter
        anchors.rightMargin: -40
    }
    Block{
        id: arm2
        comColor: "green"
        comHeight: 120
        comWidth:40
        anchors.left: body.right
        anchors.top: body.top
        anchors.horizontalCenter: body.horizontalCenter
        anchors.verticalCenter: body.verticalCenter
        anchors.leftMargin: 80
    }
    Block{
    id: eye1
    comColor: "black"
    comHeight: 20
    comWidth:20
    anchors.top: head.top
    anchors.left: head.left
    anchors.topMargin: 40
    anchors.leftMargin: 10
    }
    Block{
    id: eyes
    comColor: "black"
    comHeight: 20
    comWidth:20
    anchors.top: head.top
    anchors.right: head.right
    anchors.topMargin: 40
    anchors.rightMargin: -50
    }
}
