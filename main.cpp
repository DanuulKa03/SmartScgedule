// Copyright (C) 2020 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QDebug>
#include <QtQml/qqmlextensionplugin.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("QtProject");
    QCoreApplication::setApplicationName("SmartSchedule");

    QGuiApplication app(argc, argv);

    Q_IMPORT_QML_PLUGIN(CommonPlugin)
    Q_IMPORT_QML_PLUGIN(ModelsPlugin)
    Q_IMPORT_QML_PLUGIN(PagesPlugin)
    Q_IMPORT_QML_PLUGIN(ComponentsPlugin)
    Q_IMPORT_QML_PLUGIN(FormsPlugin)

    QQmlApplicationEngine engine;

    // Добавление путей для импорта QML
    engine.addImportPath("qrc:/qt/qml");
    engine.addImportPath("qrc:/qt/qml/UILibrary");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    // Загрузка модуля QML
    engine.loadFromModule("SmartSchedule", "Main");

    // Проверка успешности загрузки QML
    if (engine.rootObjects().isEmpty()) {
        qCritical() << "Failed to load QML root objects.";
        return -1;
    }

    return app.exec();
}
