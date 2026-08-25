/*
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.setSource(QUrl::fromLocalFile(QCoreApplication::applicationDirPath() + QLatin1String("/Qt5_CinematicExperience.qml")));
    //view.setSource(QUrl::fromLocalFile("C:/workspace/01_source/Qt5_CinematicExperience_rpi_1.0/Qt5_CinematicExperience_rpi_1.0" + QLatin1String("/Qt5_CinematicExperience.qml")));

//    const QString lowerArgument = QString::fromLatin1(argv[1]).toLower();
//    if (lowerArgument == QLatin1String("--fullscreen")) {
//        view.showFullScreen();
//    } else {
//        view.show();
//    }

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/Qt5_CinematicExperience.qml");
    engine.load(url);

    return app.exec();
}
*/

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/Qt5_CinematicExperience.qml")));

    return app.exec();
}
