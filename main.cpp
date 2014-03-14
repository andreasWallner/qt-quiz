#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/quiz/main.qml"));
    viewer.showExpanded();
    //CHANGE TO
    //viewer.showFullScreen();
    return app.exec();
}
