import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.VirtualKeyboard.Settings 2.2
import "qrc:/qml/helpers" as HELPERS

Item {
    Layout.alignment: Qt.AlignVCenter
    Layout.minimumWidth: tField.width
    height: parent.height

    // public interface
    property var validator
    property string text: "" // locale C
    property alias textField: tField
    property alias placeholderText: tField.placeholderText;
    property alias readOnly: tField.readOnly
    readonly property bool acceptableInput: hasValidInput()
    property bool changeOnFocusLost: true

    // overridables
    function doApplyInput(newText) {return true} // (return true: apply immediate)
    function hasAlteredValue() {
        var decimals = isDouble ? validator.decimals : 0
        return tHelper.hasAlteredValue(isNumeric, isDouble, decimals, tField.text, text)
    }
    function hasValidInput() {
        return tField.acceptableInput && tHelper.hasValidInput(isDouble, tField.text)
    }

    // signal handler
    onTextChanged: {
        tField.text = tHelper.strToLocal(text, isNumeric, isDouble)
    }
    onValidatorChanged: {
        tField.validator = validator
        if(isNumeric) {
            tField.inputMethodHints = Qt.ImhFormattedNumbersOnly
        }
        else {
            tField.inputMethodHints = Qt.ImhNoAutoUppercase
        }
    }
    onLocaleNameChanged: {
        tField.text = tHelper.strToLocal(text, isNumeric, isDouble)
    }

    // helpers
    HELPERS.TextHelper {
        id: tHelper
    }

    // bit of a hack to check for IntValidator / DoubleValidator to detect a numeric field
    readonly property bool isNumeric: validator !== undefined && 'bottom' in validator && 'top' in validator
    readonly property bool isDouble: isNumeric && 'decimals' in validator
    property bool inFocusKill: false
    readonly property string localeName: VirtualKeyboardSettings.locale
    function applyInput() {
        if(hasValidInput())
        {
            if(hasAlteredValue())
            {
                var newText = tHelper.strToCLocale(tField.text, isNumeric, isDouble)
                if(doApplyInput(newText)) {
                    text = newText
                }
            }
            // we changed text but did not change value
            else {
                discardInput()
            }
        }
        else {
            discardInput()
        }
    }
    function discardInput() {
        tField.text = tHelper.strToLocal(text, isNumeric, isDouble)
    }

    // controls
    TextField {
        id: tField
        bottomPadding: 8

        mouseSelectionMode: TextInput.SelectWords
        selectByMouse: true
        inputMethodHints: Qt.ImhNoAutoUppercase
        onAccepted: {
            if(hasValidInput()) {
                applyInput()
                inFocusKill = true
                focus = false
                inFocusKill = false
            }
        }
        Keys.onEscapePressed: {
            discardInput()
            inFocusKill = true
            focus = false
            inFocusKill = false
        }
        onFocusChanged: {
            if(changeOnFocusLost && !inFocusKill && !focus) {
                if(hasAlteredValue()) {
                    if(hasValidInput()) {
                        applyInput()
                    }
                    else {
                        discardInput()
                    }
                }
                else {
                    discardInput()
                }
            }
            // Hmm - maybe we should add an option for this...
            /*else {
                selectAll()
            }*/
        }

        Rectangle {
            anchors.fill: parent
            color: "red"
            opacity: 0.2
            visible: hasValidInput() === false && tField.enabled
        }
        Rectangle {
            anchors.fill: parent
            color: "green"
            opacity: 0.2
            visible: hasValidInput() && tField.enabled && hasAlteredValue()
        }
    }
}
