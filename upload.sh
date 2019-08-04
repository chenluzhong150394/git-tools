#!/bin/bash


dir_path='/home/chen/图片/git/'
#cd $dir_path

DISTROS=$(whiptail --title "git-tools" --radiolist \
"请选择你要上传的分支" 15 60 4 \
"master" "this is clear" ON \
"dev" "This is the devolps" OFF \
"自定义" "请输入你要上传的分支名字" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
	if [ $DISTROS = 'master' ]; then
		brech=$DISTROS
	fi
	if [ $DISTROS = 'dev' ]; then
		brech=$DISTROS	
	fi
	if [ $DISTROS = '自定义' ]; then
		brech=$(whiptail --title "git-tools" --inputbox "请输入分支名" 10 60 master 3>&1 1>&2 2>&3)
	fi
else
    status=1
fi

echo $brech
NAME=$(whiptail --title "欢迎使用git自动上传工具" --inputbox "请输入commit版本描述" 10 60 Nones 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
	{
	addstr=`git add .`	
	commitstr=`git commit -m "$NAME">>/dev/null 2>&1`
	echo 20
	sleep 0.5
	echo 60
	sleep 0.6
	echo 80
	source ~/ini/name.sh
	echo $USER
	echo $PASSWORD
	expect << EOF
	spawn git push -u origin $brech
	expect "Username for 'https://github.com': " {send "$USER\r"}
	expect "Password for 'https://chenluzhong150394@github.com': " {send "$PASSWORD\r"}
	expect "#" {send "exit\r"}
EOF
	echo 100
	} | whiptail --gauge "Please wait while installing" 6 60 0
	whiptail --title "执行状态" --msgbox " 执行成功!!" 10 60
else
	whiptail --title "消息通知" --msgbox "\n 		    欢迎下次使用,谢谢您的支持" 10 60

fi


###>> /dev/null 2>&1使用这种方式,将命令执行后的输出结果清除



