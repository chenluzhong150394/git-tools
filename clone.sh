#!/bin/bash

###URK是仓库地址的变量
URK=$(whiptail --title "欢迎使用git工具" --inputbox "请输入要克隆的仓库地址" 10 60 Nones 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	USER=$(whiptail --title "github登录" --inputbox "请输入您的github账号" 10 60 Peter 3>&1 1>&2 2>&3)
	PASSWORD=$(whiptail --title "github登录" --passwordbox "请输入您的github密码" 10 60 3>&1 1>&2 2>&3)
	expect << EOF
	spawn git clone https://github.com/chenluzhong150394/notebook.git
	expect "Username for 'https://github.com': " {send "$USER\r"}
	expect "Password for 'https://chenluzhong150394@github.com': " {send "$PASSWORD\r"}
	expect "#" {send "exit\r"}
EOF
	{
	echo 20
	sleep 0.5
	echo 60
	sleep 0.6
	echo 80	
	sleep 0.9
	echo 100
	} | whiptail --gauge "Please wait while installing" 6 60 0
	whiptail --title "执行状态" --msgbox " 执行成功!!" 10 60
else
	whiptail --title "消息通知" --msgbox "\n 		    欢迎下次使用,谢谢您的支持" 10 60

fi

