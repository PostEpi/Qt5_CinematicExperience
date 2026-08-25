import QtQuick

Item {
    id: root

    property var source
    property real leftHeight: height / 2
    property real rightHeight: height / 2
    property real originalHeight: height
    property real originalWidth: width
    property real amplitude: 0.10

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: Math.max(0, root.rightHeight)
        color: "#202020"
        opacity: 0.35
    }
}
