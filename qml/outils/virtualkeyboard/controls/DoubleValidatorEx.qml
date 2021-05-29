import QtQuick 2.0
import QtQuick.VirtualKeyboard.Settings 2.2

// adjust validator to locale selected
DoubleValidator {
    locale: VirtualKeyboardSettings.locale
}
