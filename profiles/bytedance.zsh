## Sources
[ -f "$HOME/.bytebm/config/config.sh" ] && . "$HOME/.bytebm/config/config.sh"

## Paths
export BTD_HOME="$HOME/Projects/ByteDance"
export PATH="$BTD_HOME/.bin:$PATH"

## Exports
export FASTLANE_SKIP_UPDATE_CHECK=1

## Project aliases
alias tt='cd $BTD_HOME/TikTok'
alias tt1='cd $BTD_HOME/TikTok1'
alias tt2='cd $BTD_HOME/TikTok2'
alias tt3='cd $BTD_HOME/TikTok3'
alias tt4='cd $BTD_HOME/TikTok4'
alias tto='open **/TikTokBazel.xcodeproj'

## Project actions
alias tti='cd Aweme; bundle exec pod install; cd ..'
alias ttio='cd Aweme; bundle exec pod install; cd ..; open **/TikTokBazel.xcodeproj'
alias ttbi='bundle install --path Local/bundle && cd Aweme; bundle exec pod install; cd ..'
alias ttbio='bundle install --path Local/bundle && cd Aweme; bundle exec pod install; cd ..; open **/TikTokBazel.xcodeproj'
alias ttsign='cosign --scope-name TikTok --xcconfig-path Aweme/Configuration/User.xcconfig'
alias ttsign1='ttsign -d 00008101-000815663410001E'
alias ttsign2='ttsign -d 00008020-001309A10E12002E'