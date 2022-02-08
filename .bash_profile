function ahead_behind() {
curr_branch=$(git rev-parse --abbrev-ref HEAD);
curr_remote=$(git config branch.$curr_branch.remote);
curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|';
}

export GPG_TTY=$(tty)

export GOPATH=$HOME/go

export PATH=~/bin:/usr/local/bin:${PATH}

set -o vi

export CLICOLOR=1
# Use vi as our default editor
alias vi=vim
export EDITOR=vim

# Use less as our default pager
export PAGER=less
# Enable color in less
export LESS="-R"

# Set the prompt
export PS1='\u@\h:\w\$ '
#export PS1='\u@\h:\w[\${ahead_behind}]$ '

# Enable color in ack (when piping)
export ACK_OPTIONS="--color"

alias okta='gopass otp -o -c sms/okta'
alias lr='gopass show -c sms/lr'
alias glass='gopass show -c sms/glass'
alias prod-secious='gopass show -c lrcops/prod-secious'


alias weather='curl http://wttr.in/DENVER'
alias moon='curl http://wttr.in/Moon'

# go stuff
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

function branch() {
  local branch="$1"
  git checkout `git branch | cat | grep ${branch}`
}

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Squash shortcut
function squashit() {
  if [ -z "$1" ]; then
    echo "provide one argument that is the branch you want to reset to"
  else
    alias squashit="git reset $(git merge-base $1 $(git rev-parse --abbrev-ref HEAD))"
  fi
}

function testit() {
  echo "hi $1"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sms/google-cloud-sdk/path.bash.inc' ]; then . '/Users/sms/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sms/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/sms/google-cloud-sdk/completion.bash.inc'; fi

# I like bash
export BASH_SILENCE_DEPRECATION_WARNING=1

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

