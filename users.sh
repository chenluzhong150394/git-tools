#!/bin/bash

###绑定账号密码
USER=$(whiptail --title "git账号管理" --inputbox "请输入您的github账号" 10 60 Peter 3>&1 1>&2 2>&3)
PASSWORD=$(whiptail --title "git账号管理" --passwordbox "请输入您的github密码" 10 60 3>&1 1>&2 2>&3)

echo "USER=$USER">~/ini/name.sh
echo "PASSWORD=$PASSWORD">>~/ini/name.sh
chmod 777 ~/ini/name.sh
whiptail --title "执行状态" --msgbox " 绑定成功!!" 10 60
