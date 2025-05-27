import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "SwipeView Example"

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page {
            id: redPage
            title: "Красная"
            Rectangle {
                anchors.fill: parent
                color: "red"
            }
        }

        Page {
            id: yellowPage
            title: "Жёлтая"
            Rectangle {
                anchors.fill: parent
                color: "yellow"
            }
        }

        Page {
            id: greenPage
            title: "Зелёная"
            Rectangle {
                anchors.fill: parent
                color: "green"
            }
        }
    }

    // Опционально: индикатор текущей страницы
    PageIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        count: swipeView.count
        currentIndex: swipeView.currentIndex
    }
}
