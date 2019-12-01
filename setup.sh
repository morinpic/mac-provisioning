#!/bin/sh

xcode-select --install

if [ ! -x "`which brew`" ]; then
  echo "start install and update brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade
  brew cleanup
  brew -v
fi

# brewfileを.brewfileとしてmackupで管理しているためmackupを先にインストールする
brew install mackup

# mackupでリストアする
mackup restore

# Homebrew Packageのインストール
brew bundle install --file=.brewfile

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true
# 隠しファイル/フォルダを表示
defaults write com.apple.finder AppleShowAllFiles true
# タイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true
# ステータスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true
# USBやネットワークストレージに.DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
