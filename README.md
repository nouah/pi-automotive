# pi-automotive

pi-automotive tested by raspberry pi3 b+
devlopped by qt5.12.3


 
enverenement setup into raspberry  pi
l_invalid_framebuffer_operation: framebuffer is incomplete
utilser parametre
--disable-gpu
ou
app.disableHardwareAcceleration() in your code

# Setup touch screen
install  tslib from github
install from source and export this parametre in /etc/profile

export TSLIB_TSDEVICE=/dev/input/event{0}
export TSLIB_PLUGINDIR=/usr/local/lib/ts
export TSLIB_FBDEVICE=/dev/fb0
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/event0:rotate=0

#/home/automotive  -platform eglfs --plugin tslib


#solution of error:


gl_invalid_framebuffer_operation: framebuffer is incomplete
utilser parametre
--disable-gpu
ou
app.disableHardwareAcceleration() in your code

