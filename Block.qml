import QtQuick 2.15

Item {
 property alias comColor: block.color
 property alias comWidth: block.width
 property alias comHeight: block.height
    Rectangle{
        id:block
    }
}
