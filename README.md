# Install
このレポジトリを ~/.config/zsh にクローンする.
```bash
cd ~/.config
git clone https://github.com/akagik/zsh.git zsh
```

/etc/zshenv を以下のように編集する.
```bash
export ZDOTDIR=$HOME/.config/zsh
```

# Requirement
oh-my-zsh のダウンロード
```bash
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

# Requirement for Mac
tree のインストール.
```bash
brew install tree
```

# Requirement for cygwin
tree が上手くうごかないのでコンパイルする.
参考: http://qiita.com/tenten0213/items/8087d86a7735117a5238

```bash
curl -LO http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz
tar xzfv tree-1.6.0.tgz
cd tree-1.6.0.tgz
```
 
Makefile を以下のように変更.
```Makefile
 # Linux defaults:
 #CFLAGS=-ggdb -Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-CFLAGS=-O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-LDFLAGS=-s
+#CFLAGS=-O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+#LDFLAGS=-s

 # Uncomment for FreeBSD:
 #CFLAGS=-O2 -Wall -fomit-frame-pointer
 @@ -47,10 +47,10 @@ LDFLAGS=-s
 #MANDIR=${prefix}/share/man/man1

 # Uncomment for Cygwin:
-#CFLAGS=-O2 -Wall -fomit-frame-pointer -DCYGWIN
-#LDFLAGS=-s
-#TREE_DEST=tree.exe
```

make 実行する.
```bash
make
make install
```

# 注意
一部の環境で .zshrc の tail -r が動かないので tac に変更する.

# TODO
tmux がインストールされてないときの対応
