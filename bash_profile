export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PATH=/usr/local/bin:$PATH

alias repos='cd ~/dev/repos/'
alias ls='ls -GFh'
alias gil='git pull --all'
alias gif='git fetch --all'
alias newb='git push -u origin'
alias srcbp='source ~/.bash_profile'
alias sublbp='subl ~/.bash_profile'
alias p415='cd ~/dev/repos/project415x.github.io/'
alias js='jekyll serve'


parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
