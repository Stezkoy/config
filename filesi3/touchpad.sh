#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
     echo "Touchpad disabled."
     notify-send -a 'Touchpad' 'Сенсорная панель выключена' -i /usr/share/icons/Papirus/48x48/devices/input-touchpad.svg #Путь до вашей иконки
else
    xinput enable $ID
     echo "Touchpad enabled."
     notify-send -a 'Touchpad' 'Сенсорная панель включена' -i /usr/share/icons/Papirus/48x48/devices/input-touchpad.svg #Путь до вашей иконки
fi
