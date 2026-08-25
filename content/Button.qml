import QtQuick
import QtQuick.Particles

Item {
    id: root

    property alias text: buttonTextItem.text
    property bool effectsOn: true
    signal clicked

    width: buttonBackgroundImage.width
    height: buttonBackgroundImage.height
    scale: mouseArea.pressed && mouseArea.containsMouse ? 0.9 : 1.0
    opacity: mouseArea.pressed && mouseArea.containsMouse ? 0.8 : 1.0

    Behavior on scale {
        NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
    }
    Behavior on opacity {
        NumberAnimation { duration: 150; easing.type: Easing.OutQuad }
    }

    BorderImage {
        id: buttonBackgroundImage
        source: "images/button.png"
        border.left: 24
        border.right: 24
        border.top: 20
        border.bottom: 20
        width: 140
    }

    // Stars effect
    ParticleSystem {
        id: particleSystem
        anchors.fill: buttonBackgroundImage
        running: root.effectsOn
        ImageParticle {
            source: "images/star.png"
            rotationVariation: 180
            color:"#ffffff"
        }
        Emitter {
            width: parent.width
            height: 8
            emitRate: 16
            lifeSpan: 2000
            size: 32
            sizeVariation: 16
            endSize: 8
            velocity: PointDirection{ y: 20; x:-2; xVariation: 5; yVariation: 10 }
        }
        Turbulence {
            width: parent.width
            height: (parent.height / 2)
            strength: 8
        }
    }

    Text {
        id: buttonTextItem
        anchors.centerIn: parent
        color: "#000000"
        font.pixelSize: 28
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -16
        onClicked: {
            root.clicked();
        }
    }
}
