import QtQuick
import QtQuick.Window
import "content"

Window {
    id: mainWindow
    visible: true
    visibility: Window.FullScreen

    width: 1920
    height: 1080
    property bool diagOverlay: false

    Item {
        width: parent.width; height: parent.height;

        QtObject {
            id: settings
            // These are used to scale fonts according to screen size
            property real _scaler: 300 + mainWindow.width * mainWindow.height * 0.00015
            property int fontXS: _scaler * 0.032
            property int fontS: _scaler * 0.040
            property int fontM: _scaler * 0.046
            property int fontMM: _scaler * 0.064
            property int fontL: _scaler * 0.100
            // Settings
            property bool showFogParticles: true
            property bool showShootingStarParticles: true
            property bool showLighting: true
            property bool showColors: true
        }



        MainView {
            id: mainView
        }

        InfoView {
            id: infoView
        }

        DetailsView {
            id: detailsView
        }

        MoviesModel {
            id: moviesModel
        }

        FpsItem {
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
        }

        Rectangle {
            anchors.fill: parent
            visible: mainWindow.diagOverlay
            z: 10000
            color: "#cc0000"
            opacity: 0.92

            Text {
                anchors.centerIn: parent
                color: "#ffffff"
                font.pixelSize: 72
                font.bold: true
                text: "DIAG OVERLAY: Qt5_CinematicExperience"
            }
        }
    }
}
