# install neovim
if type "pyenv" > /dev/null 2>&1; then
  echo "pyenv is not installed."
  exit 1
else
  pyenv install -s 3.6.5
  pyenv virtualenv 3.6.5 default_env
  pyenv global default_env
  pip install powerline-shell flake8 neovim
fi
