/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
#include <QSettings>
#include <QQuickStyle>
#include <QDebug>
#include <QObject>
#include "src/Tools.h"
int main(int argc, char *argv[])
{


     //virtual keyboard
     qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
     qputenv("QT_VIRTUALKEYBOARD_LAYOUT_PATH", QByteArray("qrc:/qml/outils/virtualkeyboard/vkeyboard/layouts"));


     qputenv("QTWEBENGINE_CHROMIUM_FLAGS",QByteArray("-single-process -disable-gpu -no-sandbox  --v=1"));
     // qputenv("QT_QPA_EGLFS_HIDECURSOR",QByteArray("1"));
     //automotive --platform eglfs --plugin tslib  -nomouse
     qputenv("QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS",QByteArray("/dev/input/event1:rotate=0"));
     //    // QQuickStyle::setStyle("Universal");
     qputenv("QT_QUICK_CONTROLS_STYLE", "Material");
     QQuickStyle::setStyle("Material");


    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

//    QIcon::setThemeName("automotive");




    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();

    app.setApplicationVersion("1.0");
    app.setOrganizationName("kovaxia");
    app.setOrganizationDomain("kovaxia.ddns.net");
    app.setApplicationName("pi-automotive");

     Tools   mtools; // Create the application core with signals and slots


     QQmlApplicationEngine engine;
     QQmlContext *context = engine.rootContext();
     context->setContextProperty("mtools", &mtools);

    /* do keep application locale fixed to "C". Locale changes
     * affect display only! */
//    QLocale locale = QLocale("fr");
//    locale.setNumberOptions(QLocale::OmitGroupSeparator | QLocale::RejectGroupSeparator);
//    QLocale::setDefault(locale);<

    //detectio usb avec udisk





    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    //QObject::connect((QObject*)view.engine(), SIGNAL(quit()), &app, SLOT(quit()));

//    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
//     if (engine.rootObjects().isEmpty())
//         return -1;



     QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                 &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
        QCoreApplication::exit(-1);
}, Qt::QueuedConnection);
engine.load(url);

return app.exec();

}
