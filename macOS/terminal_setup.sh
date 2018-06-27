# Installs and sets up everything I use for personalizing my terminal :)
# Included in this script: homebrew, git (and username config), tmux (and config), fish shell

# lol i've never tested this, pls test and update @future me

# HOMEBREW
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
# should say "your system is ready to brew." if there are no errors


# GIT
brew install git
brew link git 

# Set up git configs
git config --global user.name "laurengulland"
git config --global user.email "lauren.gulland@students.olin.edu"
git config --global push.default simple


# TMUX
brew install tmux

#Download my tmux config file into a local file and re-source the new config file
curl -o ~/.tmux.conf https://raw.githubusercontent.com/laurengulland/dotfiles/master/.tmux.conf
tmux source-file ~/.tmux.conf


# FISH
brew install fish
#add fish to the whole shells shindig
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
#make fish the default shell
chsh -s /usr/local/bin/fish 
