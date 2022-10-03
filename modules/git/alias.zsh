#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
    || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
    || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
    || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
    || _git_status_ignore_submodules='none'

#
# Aliases
#

if ! zstyle -t ':prezto:module:git:alias' skip; then
  # Git
  alias g='git'

  # Add (a)
  alias ga='git add'
  alias gaa='git add --all'
  alias gaA='git add .'
  alias gau='git add --update'

  # Branch (b)
  alias gb='git branch'
  alias gba='git branch --all --verbose'
  alias gbc='git checkout -b'
  alias gbd='git branch --delete'
  alias gbD='git branch --delete --force'
  alias gbl='git branch --verbose'
  alias gbL='git branch --all --verbose'
  alias gbm='git branch --move'
  alias gbM='git branch --move --force'
  alias gbr='git branch --move'
  alias gbR='git branch --move --force'
  alias gbs='git show-branch'
  alias gbS='git show-branch --all'
  alias gbv='git branch --verbose'
  alias gbV='git branch --verbose --verbose'
  alias gbx='git branch --delete'
  alias gbX='git branch --delete --force'

  # Commit (c)
  alias gc='git commit --verbose'
  alias gca='git commit --verbose --all'
  alias gcm='git commit --message'
  alias gcam='git commit --all --message'
  alias gco='git checkout'
  alias gcO='git checkout --patch'
  alias gcf='git commit --amend --reuse-message HEAD'
  alias gcF='git commit --verbose --amend'
  alias gcp='git cherry-pick'
  alias gcpf='git cherry-pick --ff'
  alias gcpa='git cherry-pick --abort'
  alias gcpn='git cherry-pick --no-commit'
  alias gcr='git revert'
  alias gcs='git show'
  alias gcss='git show --pretty=short --show-signature'
  alias gcl='git-commit-lost'

  # Conflict (C)
  alias gCl='git --no-pager diff --name-only --diff-filter=U'
  alias gCa='git add $(gCl)'
  alias gCe='git mergetool $(gCl)'
  alias gCo='git checkout --ours --'
  alias gCO='gCo $(gCl)'
  alias gCt='git checkout --theirs --'
  alias gCT='gCt $(gCl)'

  # Diff (d)
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gdw='git diff --cached --word-diff'

  # Fetch (f)
  alias gf='git fetch'
  alias gfa='git fetch --all'
  alias gfc='git clone'
  alias gfcr='git clone --recurse-submodules -j8'

  # Log (l)
  alias gl='git log --topo-order --pretty=format:"$_git_log_medium_format"'
  alias gls='git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
  alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
  alias glo='git log --topo-order --pretty=format:"$_git_log_oneline_format"'
  alias glg='git log --topo-order --graph --pretty=format:"$_git_log_oneline_format"'
  alias glb='git log --topo-order --pretty=format:"$_git_log_brief_format"'
  alias glc='git shortlog --summary --numbered'
  alias glS='git log --show-signature'

  # Merge (m)
  alias gm='git merge'
  alias gmF='git merge --no-ff'
  alias gma='git merge --abort'
  alias gmc='git merge --continue'
  alias gmC='git merge --no-commit'
  alias gmt='git mergetool'

  # Push & Pull (p)
  alias gp='git push'
  alias gpf='git push --force-with-lease'
  alias gpF='git push --force'
  alias gpa='git push --all'
  alias gpA='git push --all && git push --tags'
  alias gpt='git push --tags'
  alias gP='git pull'
  alias gPr='git pull --rebase'
  alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

  # Rebase (r)
  alias gr='git rebase'
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'
  alias gri='git rebase --interactive'
  alias grs='git rebase --skip'

  # Stash (s)
  alias gs='git stash'
  alias gsa='git stash apply'
  alias gsx='git stash drop'
  alias gsX='git-stash-clear-interactive'
  alias gsl='git stash list'
  alias gsL='git-stash-dropped'
  alias gsd='git stash show --patch --stat'
  alias gsp='git stash pop'
  alias gsu='git stash save --include-untracked'
  alias gsi='git stash save --include-untracked --keep-index'

  # Submodule (S)
  alias gS='git submodule'
  alias gSa='git submodule add'
  alias gSf='git submodule foreach'
  alias gSi='git submodule init'
  alias gSI='git submodule update --init --recursive'
  alias gSl='git submodule status'
  alias gSm='git-submodule-move'
  alias gSs='git submodule sync'
  alias gSu='git submodule update --remote --recursive'
  alias gSx='git-submodule-remove'

  # Tag (t)
  alias gt='git tag'
  alias gtl='git tag --list'
  alias gts='git tag --sign'
  alias gtv='git verify-tag'

  # Working Copy (w)
  alias gws='git status --ignore-submodules=$_git_status_ignore_submodules --short'
  alias gwS='git status --ignore-submodules=$_git_status_ignore_submodules'
  alias gwd='git diff --no-ext-diff'
  alias gwD='git diff --no-ext-diff --word-diff'
  alias gwr='git reset --soft'
  alias gwR='git reset --hard'
  alias gwc='git clean --dry-run'
  alias gwC='git clean --force'
  alias gwx='git rm -r'
  alias gwX='git rm -r --force'
fi
