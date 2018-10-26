export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#eval "$(pyenv init -)"


# aliases
alias v='nvim '

# datadog aliases
alias dda='datadog-agent '
alias ddas='launchctl start com.datadoghq.agent'
alias ddap='launchctl stop com.datadoghq.agent'
alias ddars='launchctl stop com.datadoghq.agent && launchctl start com.datadoghq.agent'

alias dc='docker-compose'
export DD_HOME=~/.datadog-agent



export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

export LOCALHOST='127.0.0.1'
export INADDR_ANY='0.0.0.0'


alias kstage='fair env stage'
alias kstage_secure='fair env stage-secure'
alias ksandbox='fair env stage -c sandbox-general'
alias ksandbox_secure='fair env stage -c sandbox-secure'
alias kprod='fair env prod'
alias kprod_secure='fair env prod-secure'
alias snowsql='~/Applications/SnowSQL.app/Contents/MacOS/snowsql'
alias snowsql-alooma='snowsql -w ds -d fair_dw -u alooma_service_user --prompt'

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
