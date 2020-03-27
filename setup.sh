#!bin/sh

# make dir
if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

# check zsh existence
if type "zsh" > /dev/null 2>&1; then
    echo "zsh already exist! start setup."
else
    echo "NOT exist! you must install zsh first!"
    exit
fi

# clone oh-my zsh if not
if [ ! -d ~/.oh-my-zsh ]; then
  curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
  sh install.sh
  rm install.sh
fi

# git config
FLG_NAME=false
FLG_MAIL=false

while getopts n:m: OPT
do
  case $OPT in
    n ) FLG_NAME=true ; VALUE_NAME="$OPTARG" ;;
    m ) FLG_MAIL=true ; VALUE_MAIL="$OPTARG" ;;
    * ) exit1 ;;
  esac
done

if $FLG_NAME ; then
  if $FLG_MAIL ; then
    sed -e "s/GITNAME/$VALUE_NAME/g" -e "s/GITMAIL/$VALUE_MAIL/g" ~/dotfiles/git/.gitconfig_user > ~/dotfiles/git/.gitconfig
  fi
fi

# make shimbolic link
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/powerline-shell/ ~/.config/

# clone zsh plugins into oh-my-zsh if not
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search ]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

# installing pyenv
if [ ! -d ~/.pyenv ]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
  if [ `uname` = "Linux" ]; then
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
  fi
fi

# install neovim
if type "nvim" > /dev/null 2>&1; then
  :
else
  if [ `uname` = "Linux" ]; then
    sudo apt-get install software-properties-common
    sudo apt autoremove
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim
  else
    echo "You must install neovim manually."
  fi
fi

