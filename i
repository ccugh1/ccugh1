def listening_keykoard():

    pressed = set()

    def on_press(key):

        pressed.add(key)

        # print('pressed:', pressed)

        global flag

        if pressed == {keyboard.Key.ctrl_l, keyboard.KeyCode(char="\x02")}:

            if flag:  # 开启状态按快捷键停止

                print('stop')

                flag = 0

            else:  # 停止状态按快捷键开始

                print("begin")

                flag = 1

    def on_release(key):

        if key in pressed:

            pressed.remove(key)

    print("start up")

    with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:

        listener.join()

    print("shutdown")的
