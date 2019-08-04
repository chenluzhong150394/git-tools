#! /bin/bash
expect << EOF
spawn git clone https://github.com/chenluzhong150394/notebook.git
expect "Username for 'https://github.com': " {send "chenluzhong150394\r"}
expect "Password for 'https://chenluzhong150394@github.com': " {send "chenshuo003\r"}
expect "#" {send "exit\r"}
EOF


