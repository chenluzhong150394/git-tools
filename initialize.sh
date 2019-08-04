#!/bin/bash

URRS=`git remote -v`

URR=$(whiptail --title "欢迎使用git-tools" --inputbox "当前远程仓库地址$URRS \n请输入你要绑定的仓库地址" 10 60 Nones 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	git remote remove origin
	git remote add origin $URR
	whiptail --title "执行状态" --msgbox " 更改remote执行成功!!" 10 60
else
	whiptail --title "消息通知" --msgbox "\n 		    欢迎下次使用,谢谢您的支持" 10 60

fi

