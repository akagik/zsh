# Install
このレポジトリを ~/.config/zsh にクローンする.
```bash
cd ~/.config
git clone https://github.com/akagik/zsh.git zsh
```

~/.zshenv を以下のように編集する.
```bash
export ZDOTDIR=$HOME/.config/zsh
```

# Zsh
.zshenv は ZDOTDIR 変数が追加された直後では上手く呼び出されないので、使用しないほうが良さそう. 環境変数とかは .zprofile で設定する. zprofile はログイン時に一度だけ呼び出される.
