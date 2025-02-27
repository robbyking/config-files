# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins
# plugins=(git)
source $ZSH/oh-my-zsh.sh

# Add Brew to zsh
eval "$(/opt/homebrew/bin/brew shellenv)"

#Prefix
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜$reset_color )"

# Git Prompt (Slow!)
# PROMPT+='%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info):'

# PWD (Fast!)
PROMPT+='$fg[cyan]%* $fg[blue][$fg[red]%d$fg[blue]] $fg[yellow]✘:$reset_color' 
# ⚛︎ ✘  ⌘ ⚡︎ ⚙︎ ⚒︎ ⚔︎ ⚜︎ ⚝︎ ⚞︎ ⚟︎ ⚠︎ ⚡︎ ⚢︎ ⚣︎ ⚤︎ ⚥︎ ⚦︎ ⚧︎ ⚨︎ ⚩︎ ⚪︎ ⚫︎ ⚬︎ ⚭︎ ⚮︎ ⚯︎ ⚰︎ ⚱︎ ⚲︎ ⚳︎ ⚴︎ ⚵︎ ⚶︎ ⚷︎
# ⚸︎ ⚹︎ ⚺︎ ⚻︎ ⚼︎ ⚽︎ ⚾︎ ⚿︎ ⛀︎ ⛁︎ ⛂︎ ⛃︎ ⛄︎ ⛅︎ ⛆︎ ⛇︎ ⛈︎ ⛉︎ ⛊︎ ⛋︎ ⛌︎ ⛍︎ ⛎︎ ⛏︎ ⛐︎ ⛑︎ ⛒︎ ⛓︎ ⛔︎ ⛕︎ ⛖︎ ⛗︎ ⛘︎ ⛙︎ ⛚︎ 
# ⛛︎ ⛜︎ ⛝︎ ⛞︎ ⛟︎ ⛠︎ ⛡︎ ⛢︎ ⛣︎ ⛤︎ ⛥︎ ⛦︎ ⛧︎ ⛨︎ ⛩︎ ⛪︎ ⛫︎ ⛬︎ ⛭︎ ⛮︎ ⛯︎ ⛰︎ ⛱︎ ⛲︎ ⛳︎ ⛴︎


# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✘"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%{$fg[yellow]%} ✔"
# 🦑 🌿 🌲 🌎 🦊 🚀 🦌 ⛺ ⛰ 🏔 🏕 🔥

# Righthand Prompt
# RPROMPT="$ZSH_THEME_GIT_PROMPT_PREFIX"

# File and directory shortcuts
alias ...='cd ../../'
alias ..='cd ../'
alias filecount="ls -1R | grep -v ^$ | grep -v :$ | wc -l"
alias functions="functions +"
alias grep='grep --color=auto'

# Git shortcuts
alias gb="git branch"
alias gc="git clean -f -d -x "
alias gd="git diff"
alias gf="git fetch --all --prune"
alias gf="git fetch origin main"
alias gl="git log --pretty=oneline"
alias gp="git pull"
alias gr="git reset --soft HEAD~1"
alias gs="git status -uno"
alias todo="git diff | grep -A 3 TODO"
alias xc="/Applications/Xcode\ 14.3.1.app/Contents/MacOS/Xcode"

# Dev shortcuts
alias ft="./tools/npe/npe generate feature-toggles"
alias dl="xcrun simctl openurl booted \"ebay://link?nav=webview&url=https://www.ebay.co.uk/explore\""
alias appversion='~/Developer/Bash/version-number.sh'

# See https://github.com/eza-community/eza
alias la='eza -bhHla'
alias ll='eza -bhHl'
alias ls='eza -bhHl'

# Reload your zsh profile
alias reload="source ~/.zshrc"

# Set screenshot default directory
alias updatescreenshots="defaults write com.apple.screencapture location ~/Pictures/Screenshots; killall SystemUIServer"

# Load/unload GlobalProtect
alias {unloadvpn,unloadglobalprotect,killvpn}="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias {loadvpn,loadglobalprotect,startvpn}="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"

# Hide macOS Upgrade Notifications
alias hideupdates="defaults write com.apple.systempreferences AttentionPrefBundleIDs 0"

# Delete Xcode Derived Data
function ddd() {
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	rm -rf ~/.Trash/*
	DIR="/Users/robbking/Library/Developer/Xcode/DerivedData"
	if [ "$(ls $DIR)" ]; then
		echo 'Something went wrong, try cleaning manually.'
		open $DIR
	else
	    echo 'Successfully removed all Xcode derived data!'
		git status
	fi
}

# Count files by extension
function filetypecount() {
    find . -iname "*.$@" | wc -l
}

function branchDate() {
	command git reflog show --date=iso "$@"
}

# GREP, then copy the output
function cgrep() {
	command grep "$@" |  sed 's/^ *//g' | tr '\n' ' ' | pbcopy
	pbpaste
}

function cd() {
  builtin cd "$@";
  command eza -bhHll
}

function listFunctions() {
	functions +
}

function stash(){
	command git stash push -m "$@"
}

function vpn() {
	if [ "$@" == "on" ]; then
		loadvpn
		echo "VPN enabled!"
	else
		unloadvpn
		echo "VPN disabled!"
	fi
}

function wifipassword() {
	security find-generic-password -wa "$@"
}

function gitsearch() {
  for stash in $(git stash list | cut -d: -f1); do
	echo "Searching in $stash..."
	git stash show -p $stash | grep "$@" && echo "Found in $stash"
  done
}

# Setting NodeJS Extra CA Path
export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
