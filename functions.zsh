# Functions

## Enable/Disable proxy
function proxyon() {
  # local host_port='127.0.0.1:8080'
  export all_proxy="socks5://127.0.0.1:7891"
  export http_proxy=$all_proxy
  export https_proxy=$all_proxy
  git config --global http.proxy $https_proxy
  git config --global https.proxy $https_proxy
  echo "proxy = \"$all_proxy\"" >! $HOME/.config/curl/config
}

function proxyoff() {
  export all_proxy=''
  export http_proxy=''
  export https_proxy=''
  git config --global http.proxy ''
  git config --global https.proxy ''
  echo '' >! $HOME/.config/curl/config
}

## Open $(pwd)/$@ in Finder.app
function opend() {
  if [ $# -eq 0 ]; then
      open .;
  else
      open "$@";
  fi;
}

## Reload shell
function reload() {
  local compdump_files="$ZDOTDIR/.zcompdump*"

  if ls $compdump_files &> /dev/null; then
      rm -f $compdump_files
  fi

  exec $SHELL -l
}

## File size calculator
function filesize() {
  if du -b /dev/null > /dev/null 2>&1; then
      local arg=-sbh;
  else
      local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
      du $arg -- "$@";
  else
      du $arg .[^.]* ./*;
  fi;
}

## Open man page with Dash app
function dman() {
  open "dash://man:$@"
}

## Open man page in a easy-to-read, standalone window
function xman() {
  open "x-man-page://$@"
}

## Move file to directory without retyping the name
function mv2d() {
  echo mv "$1" "$2/${1##*/}_$3"
}

## Encode/Decode string using base64
function b64e() {
  echo "$@" | base64
}

function b64d() {
  echo "$@" | base64 -D
}

## Find current IP address
function myip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}

## Generate a secure password
function passgen() {
  LC_ALL=C tr -dc ${1:-"[:graph:]"} < /dev/urandom | head -c ${2:-20}
}

## Flush DNS caches
function flushdns() {
  sudo dscacheutil -flushcache && \
  sudo killall -HUP mDNSResponder
}

## Create application icon file from an 1024px master file
function mkicns() {
  if [[ -z "$@" ]]; then
    echo "Input file missing"
  else
    filename=${1%.*}
    mkdir $filename.iconset
    sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
    sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
    sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
    sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
    sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
    sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
    sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
    sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
    sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
    cp $1 $filename.iconset/icon_512x512@2x.png
    iconutil -c icns $filename.iconset
    rm -r $filename.iconset
  fi
}

## Symbolicate crash
function symcrash() {
  export DEVELOPER_DIR=$(xcode-select --print-path)
  /Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash "$@"
}

function forkall() {
  for d in */ ; do
    local gd="$d.git"
    if [ -e $gd ]; then
      local pd=$(pwd);
      cd $d
      local gs="`LC_ALL=C git status --porcelain --ignore-submodules -unormal 2>&1`"
      [[ -n $gs ]] && fork .
      cd $pd
    fi
  done
}

function pushall() {
  find . -maxdepth 2 -name .git | rev | cut -c 6- | rev | parallel -j60 'echo -n {}... && git -C {} push'
}

function pullall() {
  find . -maxdepth 2 -name .git | rev | cut -c 6- | rev | parallel -j60 'echo -n {}... && git -C {} pull'
}

function pman() {
  local f="/tmp/pman_postscripts_$1.ps"
  if [ ! -f $f ]; then
    man -t $1 > $f
  fi
  open -a Preview $f
}
