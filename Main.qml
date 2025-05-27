import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window
    width: 360
    height: 600
    visible: true
    title: "Task_for_Login_Page"

    property string password: ""
    readonly property int maxPasswordLength: 6

    Rectangle {
        anchors.fill: parent
        color: "#f5f5f5"

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.9

            Text {
                text: "Enter your password:"
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#333"
            }

            Row {
                id: starsRow
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Repeater {
                    model: 6
                    Text {
                        text: "*"
                        font.pixelSize: 55
                        opacity: password.length > index ? 1.0 : 0.4
                    }
                }
            }

            Grid {
                id: keypad
                columns: 3
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8

                Repeater {
                    model: 9
                    Button {
                        width: keypad.width / 3 - keypad.spacing
                        height: width
                        text: index + 1
                        font.pixelSize: 24
                        onClicked: {
                            if (password.length < maxPasswordLength) {
                                password += text
                            }
                        }
                    }
                }

                Item { width: 1; height: 1 } // Пустой элемент для выравнивания

                Button {
                    width: keypad.width / 3 - keypad.spacing
                    height: width
                    text: "0"
                    font.pixelSize: 24
                    onClicked: {
                        if (password.length < maxPasswordLength) {
                            password += text
                        }
                    }
                }

                Button {
                    width: keypad.width / 3 - keypad.spacing
                    height: width
                    text: "Clear"
                    font.pixelSize: 18
                    onClicked: password = ""
                }
            }

            Button {
                id: loginButton
                width: parent.width
                height: 50
                text: "Log In"
                font.pixelSize: 18
                onClicked: {
                    console.log("Password entered:", password)
                    // Здесь можно добавить логику проверки пароля
                }
            }
        }
    }
}
