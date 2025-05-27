import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "StackView Example"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Page_start { stackView: stackView }
    }
}
