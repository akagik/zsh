# ログインシェルの場合に読み込まれる
# tmux が new-session したときなども当てはまる
if [ -d "/home/linuxbrew" ]; then
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
    export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH
fi
