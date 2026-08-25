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
#include <QDebug>
#include <QScreen>
#include <QUrl>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qInfo() << "Cinematic start. Platform:" << QGuiApplication::platformName();
    const auto screens = QGuiApplication::screens();
    qInfo() << "Screen count:" << screens.size();
    for (int i = 0; i < screens.size(); ++i) {
        const QScreen *s = screens.at(i);
        qInfo() << "Screen" << i << s->name() << s->geometry() << s->size();
    }

    QQmlApplicationEngine engine;
    const QUrl mainQmlUrl(QStringLiteral("qrc:/Qt5_CinematicExperience.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [mainQmlUrl](QObject *obj, const QUrl &objUrl) {
            if (!obj && objUrl == mainQmlUrl) {
                qCritical() << "QML load failed for" << mainQmlUrl;
                QCoreApplication::exit(-1);
                return;
            }
            if (obj && objUrl == mainQmlUrl) {
                qInfo() << "QML root object created:" << obj->metaObject()->className();
            }
        },
        Qt::QueuedConnection);
    engine.load(mainQmlUrl);
    const auto roots = engine.rootObjects();
    qInfo() << "Root object count after load:" << roots.size();
    if (!roots.isEmpty()) {
        qInfo() << "Root[0] class:" << roots.first()->metaObject()->className();
    }

    return app.exec();
}
