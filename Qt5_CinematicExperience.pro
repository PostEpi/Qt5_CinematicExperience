TEMPLATE = app

QT += qml quick
SOURCES += main.cpp


RESOURCES += \
    rc.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /home/mts/autorun
!isEmpty(target.path): INSTALLS += target

#target.path = /home/mts/autorun
#qml.files = Qt5_CinematicExperience.qml content
#qml.path = /opt/Qt5_CinematicExperience
#INSTALLS += target qml
