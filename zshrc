parse_git_branch_no_brackets() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

git_push_set_upstream(){
  git push --set-upstream origin `parse_git_branch_no_brackets`
}

# Set Ruby
alias truff='PATH=~/.rubies/truffleruby-jvm-ce/bin:$PATH; ruby -v'
alias rub='chruby 2.7.2; ruby -v'

# Git
alias gup='git fetch && git pull'
alias gco='git checkout'
alias gst='git status'
alias gl='git log --pretty'
alias gd='git diff $(git merge-base --fork-point origin/master) || git diff $(git merge-base --fork-point origin/main)'
alias gb='git branch'
alias gbl="git for-each-ref refs/heads --format='%(align:70)%(refname:short)%(end) %(committerdate:iso8601) (%(committerdate:relative))' --sort -committerdate | head -n20"
alias gpf='git push --force-with-lease'
alias gstash='git stash --include-untracked --keep-index' # Stash untracked changes and ignore staged files

alias grm='git fetch && git rebase origin/master || git rebase origin/main'
alias grmain='git fetch && git rebase origin/main'
alias grim='git fetch && git rebase --interactive origin/master || git rebase --interactive origin/main'
alias grimain='git fetch && git rebase --interactive origin/main'

alias gpsu='git_push_set_upstream'

# Bundle
alias be='bundle exec'
alias bi='bundle check || bundle install'
alias bert='bundle exec rails test'
