var tool = Qt.createComponent("MyTooltip.qml");
var tooltip;
var fadeInDelay;
var fadeOutDelay;
var tip;
function show() {
    tooltip = tool.createObject(mainWindow);
    tooltip.text = tip;
    tooltip.fadeInDelay = fadeInDelay;
    tooltip.fadeOutDelay = fadeOutDelay;
    tooltip.state = "poppedUp";
}

function close() {
    tooltip.state = "poppedDown";
}
