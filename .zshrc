# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/kohei/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# 色々拝借した: https://suin.io/568
: "キーバインディング" && {
  bindkey -e # emacs キーマップを選択
  : "Ctrl-Yで上のディレクトリに移動できる" && {
    function cd-up { zle push-line && LBUFFER='builtin cd ..' && zle accept-line }
    zle -N cd-up
    bindkey "^Y" cd-up
  }
  : "Ctrl-Dでシェルからログアウトしない" && {
    setopt ignoreeof
  }
  : "Ctrl-Wでパスの文字列などをスラッシュ単位でdeleteできる" && {
    autoload -U select-word-style
    select-word-style bash
  }
  : "Ctrl-[で直前コマンドの単語を挿入できる" && {
    autoload -Uz smart-insert-last-word
    zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' # [a-zA-Z], /, \ のうち少なくとも1文字を含む長さ2以上の単語
    zle -N insert-last-word smart-insert-last-word
    bindkey '^[' insert-last-word
    # see http://qiita.com/mollifier/items/1a9126b2200bcbaf515f
  }
}

: "略語展開(iab)" && {
  alias h="history"
  alias l="ls -laG" # G: macOSで色を付ける
  alias la="ls -lahG"
  alias l1="ls -1G"
  alias tree="tree -NC" # N: 文字化け対策, C:色をつける
  alias gf="git diff"
  alias gfc="git diff --cached"
  alias gs="git status -s"
}

: "cd先のディレクトリのファイル一覧を表示する" && {
  [ -z "$ENHANCD_ROOT" ] && function chpwd { tree -L 1 } # enhancdがない場合
  [ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="tree -L 1" # enhancdがあるときはそのHook機構を使う
}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim=nvim

# 自動でデタッチされたセッションがないかを確認してあればアタッチする
tmux_automatically_attach_session
