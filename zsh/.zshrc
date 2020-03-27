##path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_FILES="${HOME}/.zsh"

##set path for pyenv
export XDG_CONFIG_HOME="${HOME}/.config"

##powerline-shell
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

##plugins
plugins=(
  git pip pyenv virtualenv zsh-syntax-highlighting zsh-autosuggestions history-substring-search zsh-completions
)

source $ZSH/oh-my-zsh.sh

##--------------------------------       mysetting        -------------------------------- 
export LANG=ja_JP.UTF-8
export LC_ALL="en_US.UTF-8"
#historyファイル指定
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=10000

#コマンドじゃなければ cd する
setopt auto_cd
# 補完候補を一覧表示
setopt auto_list
# TAB で順に補完候補を切り替える
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# コマンドミスった時のcorrect
setopt correct
# 補完候補一覧でファイルの種別をマーク表示
setopt list_types
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt
# ビープを鳴らさない
setopt nobeep
# vcs有効化
setopt prompt_subst
# #以降をコメントとして扱う
setopt interactive_comments
# ヒストリの共有
setopt share_history
# ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

##source aliases
alias vim="nvim"
if [ -f "${ZSH_FILES}/alias_sshfs.zsh" ]; then
  source ${ZSH_FILES}/alias_sshfs.zsh
fi

##source enviroment values
alias vim="nvim"
if [ -f "${ZSH_FILES}/EV.zsh" ]; then
  source ${ZSH_FILES}/EV.zsh
fi

##osごとのキャッシュファイルsetting(主にnvimr)
# export OS=$(uname)
# if [ $OS = 'Linux' ]; then
#   export XDG_CACHE_HOME=$HOME/.cachenvimLinux
#   pyenv activate env_linux
# elif [ $OS = 'Darwin' ]; then
#   export XDG_CACHE_HOME=$HOME/.cachenvimMac
#   pyenv activate env_mac
# elif [ $OS = 'FreeBSD' ]; then
#   export XDG_CACHE_HOME=$HOME/.cachenvimFreeBSD
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_FILES="${HOME}/.zsh"

##set path for pyenv
export XDG_CONFIG_HOME="${HOME}/.config"
# ZSH_THEME="bullet-train"
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

plugins=(
  git pip pyenv virtualenv zsh-syntax-highlighting zsh-autosuggestions history-substring-search zsh-completions
)

source $ZSH/oh-my-zsh.sh

##--------------------------------       mysetting        -------------------------------- 
export LANG=ja_JP.UTF-8
export LC_ALL="en_US.UTF-8"
#historyファイル指定
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=10000

#コマンドじゃなければ cd する
setopt auto_cd
# 補完候補を一覧表示
setopt auto_list
# TAB で順に補完候補を切り替える
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# コマンドミスった時のcorrect
setopt correct
# 補完候補一覧でファイルの種別をマーク表示
setopt list_types
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt
# ビープを鳴らさない
setopt nobeep
# vcs有効化
setopt prompt_subst
# #以降をコメントとして扱う
setopt interactive_comments
# ヒストリの共有
setopt share_history
# ヒストリに追加されるコマンドが古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

##source aliases
alias vim="nvim"
if [ -f "${ZSH_FILES}/alias_sshfs.zsh" ]; then
  source ${ZSH_FILES}/alias_sshfs.zsh
fi

##source enviroment values
alias vim="nvim"
if [ -f "${ZSH_FILES}/EV.zsh" ]; then
  source ${ZSH_FILES}/EV.zsh
fi

##gcloud settings
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
