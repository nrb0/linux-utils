#!/usr/bin/env python

from pymouse import PyMouseEvent
from pykeyboard import PyKeyboard

k = PyKeyboard()
class MouseToButton(PyMouseEvent):
    def click(self, x, y, button, press):
        if button == 8:
            if press:    # press
                k.press_key(k.control_l_key)
            else:        # release
                k.release_key(k.control_l_key)
        elif button == 9:
            if press:
                k.press_key(k.shift_l_key)
            else:
                k.release_key(k.shift_l_key)

try:
    C = MouseToButton()
    C.run()
except KeyboardInterrupt:
    print('\nK thx bye!')
    exit()