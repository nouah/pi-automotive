/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Virtual Keyboard module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.VirtualKeyboard 2.1
import "qrc:/qml/outils/virtualkeyboard/vkeyboard" as VKEYB
import QtQuick.VirtualKeyboard.Settings 2.2


KeyboardLayout {
    inputMode: InputEngine.InputMode.Latin
   // sourceComponent: InputContext.shift ? page2 : page1
    keyWeight: 160

            KeyboardRow {
                Key {
                    text: "\u0636"
                }
                Key {
                    text: "\u0635"
                }
                Key {
                    text: "\u062B"
                }
                Key {
                    text: "\u0642"
                }
                Key {
                    text: "\u0641"
                }
                Key {
                    text: "\u063A"
                }
                Key {
                    text: "\u0639"
                }
                Key {
                    text: "\u0647"
                }
                Key {
                    text: "\u062E"
                }
                Key {
                    text: "\u062D"
                }
                Key {
                    text: "\u062C"
                }
                Key {
                    text: "\u062F"
                }
                BackspaceKey {}
            }
            KeyboardRow {
                FillerKey {
                    weight: 56
                }
                Key {
                    text: "\u0634"
                }
                Key {
                    text: "\u0633"
                }
                Key {
                    text: "\u064A"
                }
                Key {
                    text: "\u0628"
                }
                Key {
                    text: "\u0644"
                }
                Key {
                    text: "\u0627"
                }
                Key {
                    text: "\u062A"
                }
                Key {
                    text: "\u0646"
                }
                Key {
                    text: "\u0645"
                }
                Key {
                    text: "\u0643"
                }
                Key {
                    text: "\u0637"
                }
                EnterKey {
                    weight: 283
                }
            }
            KeyboardRow {
                keyWeight: 156
                ShiftKey {}
                Key {
                    text: "\u0626"
                }
                Key {
                    text: "\u0621"
                }
                Key {
                    text: "\u0624"
                }
                Key {
                    text: "\u0631"
                }
                Key {
                    text: "\u0644\u0627"
                }
                Key {
                    text: "\u0649"
                }
                Key {
                    text: "\u0629"
                }
                Key {
                    text: "\u0648"
                }
                Key {
                    text: "\u0632"
                }
                Key {
                    text: "\u0638"
                }
                ShiftKey {
                    weight: 264
                }
            }
            KeyboardRow {
                keyWeight: 154
                SymbolModeKey {
                    weight: 217
                    displayText: "\u0661\u0662\u0663\u061F"
                }
                ChangeLanguageKey {
                    weight: 154
                }
                SpaceKey {
                    weight: 864
                }
                Key {
                    key: 0x060C
                    text: "\u060C"
                    alternativeKeys: ".,\u060C\u061F"
                }
                Key {
                    key: 0xE000
                    text: ":-)"
                    alternativeKeys: [ ";-)", ":-)", ":-D", ":-(", "<3" ]
                }
                HideKeyboardKey {
                    weight: 204
                }
            }
        }






