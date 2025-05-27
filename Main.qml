import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: "Multiple Page Layouts"

    property int currentPageIndex: 0

    // Импортируем страницы
    Page1 { id: page1; visible: currentPageIndex === 0; anchors.fill: parent }
    Page2 { id: page2; visible: currentPageIndex === 1; anchors.fill: parent }
    Page3 { id: page3; visible: currentPageIndex === 2; anchors.fill: parent }
    Page4 { id: page4; visible: currentPageIndex === 3; anchors.fill: parent }

    // Кнопки переключения страниц
    Row {
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10

        Button { text: "Page 1"; onClicked: currentPageIndex = 0 }
        Button { text: "Page 2"; onClicked: currentPageIndex = 1 }
        Button { text: "Page 3"; onClicked: currentPageIndex = 2 }
        Button { text: "Page 4"; onClicked: currentPageIndex = 3 }
    }
}
