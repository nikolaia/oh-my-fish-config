# Install homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install coreutils
brew install findutils
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# $PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Normal brew
brew install bash
brew install android-sdk
brew install fish
brew install node
brew install watchman
brew install flow
brew install z
brew install awscli
brew install mono
brew install mackup
# After loging in to dropbox: mackup restore

# Cask
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install lastpass
brew cask install sublime-text
brew cask install atom
brew cask install visual-studio-code
brew cask install dropbox
brew cask install vlc
brew cask install moom
brew cask install microsoft-office
brew cask install beamer
brew cask install transmission
brew cask install spotify
brew cask install skype
brew cask install slack
brew cask install discord
brew cask install evernote
brew cask install sourcetree
brew cask install google-drive
brew cask install google-photos-backup
brew cask install azure-cli
#brew cask install gopro-studio

# Fonts
brew tap caskroom/fonts
brew cask install font-office-code-pro

brew cleanup

# NPM Global installs
npm install -g code-push-cli grunt-cli react-native-cli yo generator-aspnet
