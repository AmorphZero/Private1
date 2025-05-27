import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 350
    height: 600
    title: "Task_for_Login_Page"

    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"

        Column {
            anchors.centerIn: parent
            spacing: 10
            width: parent.width * 0.7

            TextField {
                id: usernameField
                placeholderText: "Username"
                font.pixelSize: 14
                selectByMouse: true
                width: parent.width
            }

            TextField {
                id: passwordField
                placeholderText: "Password"
                echoMode: TextInput.Password
                font.pixelSize: 14
                selectByMouse: true
                width: parent.width
            }

            Row {
                spacing: 20
                width: parent.width

                Button {
                    text: "Log In"
                    enabled: usernameField.text.length > 0 && passwordField.text.length > 0
                    onClicked: {
                        // Здесь можно обработать логин
                        console.log("Log In clicked with username:", usernameField.text)
                    }
                }

                Button {
                    text: "Clear"
                    onClicked: {
                        usernameField.text = ""
                        passwordField.text = ""
                        usernameField.focus = true
                    }
                }
            }
        }
    }
}
