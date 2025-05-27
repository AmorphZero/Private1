import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "SwipeView с масштабированием"

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        function createPage(colorName, titleText) {
            return Qt.createComponent("PageWithZoom.qml").createObject(swipeView, {
                pageColor: colorName,
                pageTitle: titleText
            })
        }

        Component.onCompleted: {
            for (var i = 0; i < 3; i++) {
                var page;
                if (i === 0)
                    page = createPage("red", "Красная");
                else if (i === 1)
                    page = createPage("yellow", "Жёлтая");
                else
                    page = createPage("green", "Зелёная");
                swipeView.addItem(page);
            }
            // Удаляем пустой первый элемент
            swipeView.removeItem(0);
        }
    }

    PageIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        count: swipeView.count
        currentIndex: swipeView.currentIndex
    }
}
