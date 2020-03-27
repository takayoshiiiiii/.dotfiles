if type "pyenv" > /dev/null 2>&1; then
  pyenv install -s 3.6.5
  pyenv virtualenv 3.6.5 default_env
  pyenv global default_env
  pip install pip setuptools -U
  pip install powerline-shell flake8 neovim
else
  echo "pyenv is not installed."
  exit 1
fi
