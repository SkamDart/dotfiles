export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#eval "$(pyenv init -)"


# aliases
alias v='nvim '

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

export LOCALHOST='127.0.0.1'
export INADDR_ANY='0.0.0.0'

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
