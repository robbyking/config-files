# File and directory shortcuts
alias ...='cd ../../'
alias ..='cd ../'
alias ack="ack -l"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias filecount="ls -1R | grep -v ^$ | grep -v :$ | wc -l"

# Git shortcuts
alias gb="git branch"
alias grep='grep --color=auto'
alias gs="git status --porcelain | sed -e 's!.*/!!'"
alias gs="git status"
alias gss="git status --porcelain | sed -e 's!.*/!!'"

# See https://the.exa.website/
alias la='exa -bhHla --git'
alias ll='exa -bhHl --git'
alias ls='exa -bhH'

# Reload your bash profile
alias reload="source ~/.bash_profile"

# Set screenshot default directory
alias updatescreenshots="defaults write com.apple.screencapture location ~/Pictures/Screenshots; killall SystemUIServer"

function cd() {
  command cd "$@";
  setPS1
  command exa -bhHla --git
}

function clean() {
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	rm -rf ~/.Trash/*
	DIR="/Users/<USERNAME>/Library/Developer/Xcode/DerivedData"
	if [ "$(ls $DIR)" ]; then
		echo 'Something fucked up, try cleaning manually.'
		open $DIR
	else
	    echo 'Successfully removed all Xcode derived data!'
	fi

	echo 'Unstaged files:'
	git status
}

function filetypecount() {
    find . -iname "*.$@" | wc -l
}

function grepcopy() {
    command grep "$@" | pbcopy
    pbpaste
}

function setPS1() {

	#Color reference
	#Black 	0;30
	#Blue 	0;34	Light Blue 1;34
	#Brown 	0;33
	#Cyan 	0;36 	Light Cyan 1;36
	#Gray 	1;30 	Light Gray 0;37
	#Green 	0;32 	Light Green 1;32
	#Purple 0;35	Light Purple 1;35
	#Red 	0;31 	Light Red 1;31
	#White 	1;37
	#Yellow	1;33

	#Grey prompt
	#export PS1="\e[2m[\t]\e[0m $PWD\e[0;31m:\e[0m"

	#Blue prompt
	#export PS1="\[\e[0;34m\][\t]\[\e[m\] $PWD\e[0;31m:\e[0m"

	#Hybrid prompt
	export PS1="\[\e[0;34m\][\t]\[\e[m\] \e[1;37m\]$PWD\[\e[m\e[0;31m:\e[0m"

	#Two line prompt
	#export PS1="\e[1;37m\]$PWD\[\e[m\e[0;31m\e[0m \n\[\e[0;34m\][\t]\[\e[m\]:"


	#Hybrid prompt (current directory name only)
	# export PS1="\[\e[0;34m\][\t]\[\e[m\] \e[1;37m\]${PWD##*/}\[\e[m\e[0;31m:\e[0m"
	# 🦑 🌿 🌲 🌎 🦊 🚀 🦌 ⛺ ⛰ 🏔 🏕 🔥
}

function wifipassword() {
	security find-generic-password -wa "$@"
}

# Git autocomplete
export PATH="$HOME/.fastlane/bin:$PATH"

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#Move to git directory and check status
cd ~/Developer/ios_core
