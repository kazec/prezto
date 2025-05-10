# Aliases

## Show hidden files in Finder.app
alias fshow='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias fhide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

## Git shortcuts
# alias git='git -c core.hooksPath=/dev/null'
alias gclone='git clone --recurse-submodules -j8'
alias gamend='git commit -a --amend --reuse-message HEAD'
alias gbvv="git branch -vv"
alias gcAm='git add . && git commit --message'
alias gC='git checkout'
alias gCf='git checkout -f'
alias gS='git status'
alias gsu='git stash -u'
alias gsA='git stash -a'
alias gwR='git stash -u && git reset --hard'
alias gD='git diff'
alias gmc='git merge --continue'
alias gpu='git push -u'
alias gP="git pull"
alias gl1="gl -1"
alias gl2="gl -2"
alias gl3="gl -3"
alias gwa="git worktree add"
alias gwx="git worktree remove"
alias gwl="git worktree list"
alias gwm="git worktree move"
alias gwp="git worktree prune"
alias gdangling="git fsck --no-reflog | awk '/dangling commit/ {print $3}' | xargs -n1 git log -p -1 | cat"

## Java shortcuts
alias jhu='unset JAVA_HOME'
alias jh8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias jh11='export JAVA_HOME=$(/usr/libexec/java_home -v 11)'
alias jh12='export JAVA_HOME=$(/usr/libexec/java_home -v 12)'

## Misc shortcuts
alias ls='eza -l --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lha --icons --group-directories-first'
alias lD='eza -lhD --icons'
alias lt1='la -TL=1'
alias lt2='la -TL=2'
alias lt3='la -TL=3'
alias lt4='la -TL=4'
alias lg='la | grep'
alias pg='ps aux | grep'
alias py='python'
alias py3='python3'
alias spm='swift package'
alias ydl='youtube-dl'
alias sml='streamlink'
alias sha256='shasum -a 256'
alias ring='afplay /System/Library/Sounds/Ping.aiff -v 2'
alias brewU='brew update && brew upgrade'
alias rgf='rg -F'
alias kxcd='killall Xcode'
