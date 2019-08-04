dir_path='/home/chen/我的shell脚本/github-tools'
DIR="$( cd "$( dirname "$0"  )" && pwd  )"

OPTION=$(whiptail --title "git工具" --menu "\n    		请选择你要进行的git操作" 15 60 6 \
"1" "上传-push" \
"2" "拉取-pull" \
"3" "克隆-clone" \
"4" "生成ssh秘钥" \
"5" "绑定远程仓库地址" \
"6" "绑定git账号密码" 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
	if [ $OPTION = 1 ]; then
		## 加载上传脚本
		$DIR/upload.sh
	fi
	if [ $OPTION = 2 ]; then
		cd $dir_path
		whiptail --title "消息通知" --msgbox "\n 		    执行成功" 10 60
		asdstr=`git pull`	
		whiptail --title "消息通知" --msgbox "\n 		    $asdstr" 10 60		
	fi
	if [ $OPTION = 3 ]; then
		$DIR/clone.sh	
	fi
	if [ $OPTION = 5 ]; then
		$DIR/initialize.sh	
	fi
	if [ $OPTION = 6 ]; then
		$DIR/users.sh	
	fi
else
    whiptail --title "消息通知" --msgbox "\n 		    欢迎下次使用,谢谢您的支持" 10 60
fi

