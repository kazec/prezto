## Sources
[ -f "$HOME/.bytebm/config/config.sh" ] && . "$HOME/.bytebm/config/config.sh"

## Exports
export FASTLANE_SKIP_UPDATE_CHECK=1
alias mddxr="export MBOX_DEBUG_DEVICE_UDID='00008020-001309A10E12002E'"
alias mdd12p="export MBOX_DEBUG_DEVICE_UDID='00008101-000815663410001E'"
mdd12p

## Project aliases
alias tt1='cd ~/Projects/ByteDance/TikTok1'
alias tt2='cd ~/Projects/ByteDance/TikTok2'

## MBox aliases
alias mSA='mA ~/Projects/ByteDance/TikTok1 ~/Projects/ByteDance/TikTok2 status'
alias mUA='mA ~/Projects/ByteDance/TikTok1 ~/Projects/ByteDance/TikTok2 update'
alias mpi='mbox jojo install; ring'
alias mpio='mbox jojo install && mopen; ring'
alias mpid='mbox jojo install && mbox cosign --udid=$MBOX_DEBUG_DEVICE_UDID; ring'
alias mpido='mbox jojo install && mbox cosign --udid=$MBOX_DEBUG_DEVICE_UDID && mopen; ring'
alias mpidb='mbox jojo install && mbox cosign --udid=$MBOX_DEBUG_DEVICE_UDID; jojob; mopen; ring'
alias jojob=".jojo/jojo build -y TikTok/Aweme/project.yml -t Musically -s MusicallyInhouseDebug -a arm64 --plugin TikTok/jojo_plugin.py --script_path TikTok/Aweme/ScriptsPhases --use-cache"
alias jojobt=".jojo/jojo build -y TikTok/Aweme/project.yml -t TikTok -s TikTokInhouseDebug -a arm64 --plugin TikTok/jojo_plugin.py --script_path TikTok/Aweme/ScriptsPhases --use-cache"
alias mpu='mbox pod update'
alias mbx='mbox remove'
alias mbxr='mbox remove --include-repo'
alias mbX='mbox remove --force'
alias mbXr='mbox remove --force --include-repo'
alias mbm='mbox merge'
alias mff='mbox git add . && mbox feature free'
alias mfs='mbox git add . && mbox feature start'
alias mos='mbox git add . && mbox feature start --prefix=optimize'
alias mbs='mbox git add . && mbox feature start --prefix=bugfix'
alias mfr='mbox feature rename'
alias mfx='mbox feature remove --include-repo'
alias mfm='mbox feature merge'
alias mfl='mbox feature list'
alias mdd='mbox cosign --udid=$MBOX_DEBUG_DEVICE_UDID'
alias mud='mbox cosign --undo'
alias mgC='mbox git checkout'
alias mgCf='mbox git checkout -f'
alias mgbc='mbox git checkout -b'
alias mgcm='mbox git commit -m'
alias mgcam='mbox git commit -a -m'
alias mgm='mbox git merge'
alias mgS='mbox git status'
alias mgs='mbox git-sheet status'
alias mgp='mbox git-sheet push'
alias mgP='mbox git-sheet pull'
alias mgpf='mbox git push --force-with-lease'
alias mgupdate='mbox git fetch origin develop:develop && mbox git checkout origin/develop'
alias mopen='open "$(basename $(PWD)).xcodeproj"'
alias mfork='mbox fork --all'
alias mcu='mbox container use'
alias mcutt='mbox container use TikTok'
alias kbzl='killall jojo-cache-manager; killall bazel-remote'

# MBox functions

## MBox add multiple repos at once
function mba() {
  for repo in $@
  do
    mbox add $repo
  done
}

## MBox add multiple repos at once as worktree
function mbaw() {
  local tree=${@: -1}

  for repo in ${@[@]:1:-1}
  do
    mbox add $repo --mode='worktree' $tree
  done
}

## MBox execute with alias
function ma() {
  local cmd=$(_alias_for $1)
  local args=${@[@]:2}

  if [[ -z $cmd ]]; then
    echo "Could not find alias for $1"
  else
    echo "\033[32mCommand: \033[0;96mmbox $cmd\033[0m"
    eval "mbox $cmd $args"
  fi
}

function mA() {
  if [[ -z $2 ]]; then
    mbox $1
  else
    local pwd=$PWD
    local cmd=${@: -1}

    for repo in ${@[@]:1:-1}
    do
      echo "\n\033[0;96m[in $repo]\033[0m"
      cd $repo && mbox $cmd
    done

    cd $pwd
  fi
}

function mS() {
  mA $@ status
}
