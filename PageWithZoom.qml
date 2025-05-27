import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: page
    property color pageColor: "white"
    property string pageTitle: ""

    title: pageTitle

    // Масштабируемый контейнер
    Item {
        id: zoomableContent
        anchors.fill: parent
        transform: Scale {
            id: scaleTransform
            origin.x: zoomableContent.width / 2
            origin.y: zoomableContent.height / 2
            xScale: scaleFactor
            yScale: scaleFactor
        }

        Rectangle {
            anchors.fill: parent
            color: pageColor
        }

        PinchArea {
            anchors.fill: parent
            pinch.target: zoomableContent
            pinch.minimumScale: 0.5
            pinch.maximumScale: 3.0

            onPinchUpdated: {
                scaleFactor = pinch.scale
            }
        }

        // Обработка колесика мыши для масштабирования
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

            onWheel: {
                var step = wheel.angleDelta.y > 0 ? 0.1 : -0.1
                scaleFactor = Math.min(Math.max(scaleFactor + step, 0.5), 3.0)
            }
        }
    }

    property real scaleFactor: 1.0
}
