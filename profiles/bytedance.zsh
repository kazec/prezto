# Exports

export FASTLANE_SKIP_UPDATE_CHECK=1
export MBOX_DEBUG_DEVICE_UDID='00008020-001309A10E12002E'

# Project aliases

alias tt1='cd ~/Workspaces/ByteDance/TikTok1'
alias tt2='cd ~/Workspaces/ByteDance/TikTok2'

# MBox aliases

alias m0='cd ~/Projects/MBox'
alias m1='cd ~/Projects/MBox1'
alias m2='cd ~/Projects/MBox2'
alias m3='cd ~/Projects/MBox3'
alias m4='cd ~/Projects/MBox4'
alias m0S='mS ~/Projects/MBox'
alias m1S='mS ~/Projects/MBox1'
alias m2S='mS ~/Projects/MBox2'
alias m3S='mS ~/Projects/MBox3'
alias m4S='mS ~/Projects/MBox4'
alias mSA='mA ~/Projects/MBox ~/Projects/MBox1 ~/Projects/MBox2 ~/Projects/MBox3 ~/Projects/MBox4 status'
alias mUA='mA ~/Projects/MBox ~/Projects/MBox1 ~/Projects/MBox2 ~/Projects/MBox3 ~/Projects/MBox4 update'
alias mpi='mbox pod install; ring'
alias mpio='mbox pod install && mbox go; ring'
alias mpid="mbox pod install && mbox aweme debug --udid=$MBOX_DEBUG_DEVICE_UDID; ring"
alias mpido="mbox pod install && mbox aweme debug --udid=$MBOX_DEBUG_DEVICE_UDID && mbox go; ring"
alias mpu='mbox pod update'
alias mbx='mbox remove'
alias mbxr='mbox remove --include-repo'
alias mbX='mbox remove --force'
alias mbXr='mbox remove --force --include-repo'
alias mbm='mbox merge'
alias mff='mbox git add . && mbox feature free --no-install'
alias mfs='mbox git add . && mbox feature start --no-install'
alias mos='mbox git add . && mbox feature start --prefix=optimize --no-install'
alias mbs='mbox git add . && mbox feature start --prefix=bugfix --no-install'
alias mfr='mbox feature rename'
alias mfx='mbox feature remove --include-repo'
alias mfm='mbox feature merge'
alias mfl='mbox feature list'
alias mdd="mbox aweme debug --udid=$MBOX_DEBUG_DEVICE_UDID"
alias mud='mbox aweme debug --undo'
alias mgC='mbox git checkout'
alias mgCf='mbox git checkout -f'
alias mgbc='mbox git checkout -b'
alias mgcm='mbox git commit -m'
alias mgcam='mbox git commit -a -m'
alias mgm='mbox git merge'
alias mgS='mbox git status'
alias mgp='mbox git push'
alias mgP='mbox git pull'
alias mgpf='mbox git push --force-with-lease'
alias mgupdate='mbox git fetch origin develop:develop && mbox git checkout origin/develop'
alias mopen='mbox go'
alias mfork='mbox fork --all'

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
