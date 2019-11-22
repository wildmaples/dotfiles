# Aliases

alias gco='git checkout'
alias gst='git status'
alias gl='git log'

alias gp='git push'
alias gpf='git push --force-with-lease'

alias grm='git fetch && git rebase origin/master'
alias grim='git fetch && git rebase --interactive origin/master'

alias be='bundle exec'
alias bi='bundle check || bundle install'
alias bert='bundle exec rails test'
alias rerunt='rerun bundle exec rails test'

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

