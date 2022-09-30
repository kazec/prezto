## Sources
[ -f "$HOME/.bytebm/config/config.sh" ] && . "$HOME/.bytebm/config/config.sh"

## Exports
export FASTLANE_SKIP_UPDATE_CHECK=1
alias mddxr="export MBOX_DEBUG_DEVICE_UDID='00008020-001309A10E12002E'"
alias mdd12p="export MBOX_DEBUG_DEVICE_UDID='00008101-000815663410001E'"
mdd12p

## Project aliases
alias tt='cd ~/Projects/ByteDance/TikTok'
alias tt1='cd ~/Projects/ByteDance/TikTok1'
alias tt2='cd ~/Projects/ByteDance/TikTok2'
alias tt3='cd ~/Projects/ByteDance/TikTok3'
alias tt4='cd ~/Projects/ByteDance/TikTok4'
alias tto='open **/TikTokBazel.xcodeproj'
alias tti='cd Aweme; bundle exec pod install; cd ..'
alias ttio='cd Aweme; bundle exec pod install; cd ..; open **/TikTokBazel.xcodeproj'
alias ttbi='bundle install --path Local/bundle && cd Aweme; bundle exec pod install; cd ..'
alias ttbio='bundle install --path Local/bundle && cd Aweme; bundle exec pod install; cd ..; open **/TikTokBazel.xcodeproj'
