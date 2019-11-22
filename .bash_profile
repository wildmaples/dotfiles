if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"

BOLD_BLUE="\\[\033[01;34m\]"
BLUE="\\[\033[00;34m\]"
YELLOW="\\[\033[00;33m\]"
BOLD_CYAN="\\[\033[01;36m\]"
CYAN="\\[\033[00;36m\]"
LIGHT_RED="\\[\033[01;31m\]"
RESET="\\[\033[0m\]"


PS1="👩🏻‍💻 $RED\w$YELLOW\$(parse_git_branch)$WHITE ➜ "

export EDITOR="code-insiders"

# if [ -e /Users/mapleong/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mapleong/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Aliases

alias gco='git checkout'
alias gst='git status'
alias gl='git log'
alias gd='git diff'
alias gb='git branch'
alias gbl="git for-each-ref refs/heads --format='%(align:70)%(refname:short)%(end) %(committerdate:iso8601) (%(committerdate:relative))' --sort -committerdate | head -n20"

alias gpf='git push --force-with-lease'

alias grm='git fetch && git rebase origin/master'
alias grim='git fetch && git rebase --interactive origin/master'

alias be='bundle exec'
alias bi='bundle check || bundle install'
alias bert='bundle exec rails test'
alias rerunt='rerun bundle exec rails test'

alias devup='brew uninstall mysql-client && dev up' # to fix services-db to shopify dev up

git_push_set_upstream(){
  git push --set-upstream origin `parse_git_branch_no_brackets`
}
parse_git_branch_no_brackets() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
alias gpsu='git_push_set_upstream'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
