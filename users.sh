#!/bin/bash

##查看脚本所在目录
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

if [ ! -d "~/ini" ]; then
 mkdir -p ~/ini
fi




source ~/ini/name.sh

##当前账号密码展示
whiptail --title "Message box title" --msgbox " 账号名:$USER \n 密码:$PASSWORD" 10 60

###绑定账号密码
USER=$(whiptail --title "git账号管理" --inputbox "请输入您的github账号" 10 60 $USER 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	PASSWORD=$(whiptail --title "git账号管理" --passwordbox "请输入您的github密码" 10 60 3>&1 1>&2 2>&3)
	exitstatus=$?

	if [ $exitstatus = 0 ]; then
		echo "USER=$USER">~/ini/name.sh
		echo "PASSWORD=$PASSWORD">>~/ini/name.sh
		chmod 777 ~/ini/name.sh
	else
		whiptail --title "通知" --msgbox " 欢迎下次继续使用,谢谢!!" 10 60
			
	fi		
		
else
	whiptail --title "通知" --msgbox " 欢迎下次继续使用,谢谢!!" 10 60
fi

$DIR/menu.sh
