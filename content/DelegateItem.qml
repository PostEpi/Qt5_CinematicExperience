import QtQuick

Item {
    id: root

    property string name
    property bool isSelected: listView.currentIndex === index

    width: parent ? parent.width : imageItem.width
    height: imageItem.height
    z: isSelected ? 1000 : -index
    rotation: isSelected ? 0 : -15
    scale: isSelected ? mainView.height/540 : mainView.height/1080
    opacity: 1.0 - Math.abs((listView.currentIndex - index) * 0.25)

    Behavior on rotation {
        NumberAnimation { duration: 500; easing.type: Easing.OutBack }
    }
    Behavior on scale {
        NumberAnimation { duration: 1500; easing.type: Easing.OutElastic }
    }
    Behavior on opacity {
        NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (isSelected) {
                detailsView.image = model.image
                detailsView.name =  model.name
                detailsView.year = model.year
                detailsView.director = model.director
                detailsView.cast = model.cast
                detailsView.rating = model.rating
                detailsView.overview = model.overview
                detailsView.show();
            } else {
                listView.currentIndex = index;
                if (settings.showShootingStarParticles) shootingStarBurst.burst(50);
            }
        }
    }

    Image {
        id: imageItem
        anchors.horizontalCenter: parent.horizontalCenter
        source: "images/" + model.image
        visible: true
    }
}
