#!/bin/sh

# ==== システム環境設定 ====
echo "Start system environment settings"
# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true
# カーソルの移動速度を変更 （1〜15）
defaults write -g com.apple.trackpad.scaling -float 15
# キーのリピート
defaults write -g KeyRepeat -int 1
# リピート入力認識までの時間
defaults write -g InitialKeyRepeat -int 11
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
# ファインダー関連の設定を反映させるため再起動
killall Finder
echo "End system environment settings"

# Command Line Toolsをインストール
xcode-select --install

# Homebrewのインストール
if [ ! -x "`which brew`" ]; then
  echo "start install and update brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew upgrade
  brew cleanup
  brew -v
fi

# M1対応
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# brewfileを.brewfileとしてmackupで管理しているためmackupを先にインストールする
brew install mackup

# mackupのbackup先はドロップボックスなので先にインストールしておく
brew install dropbox

# AppStoreとDropboxへのログインを促す
read -p "Please log in to Appstore & Dropbox!!"

# mackupでリストアする
mackup restore

# Homebrew Packageのインストール
brew bundle install --file=~/.brewfile
