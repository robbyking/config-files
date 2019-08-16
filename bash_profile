#Move to git directory and check status
cd ~/Developer/ios_core
git status

#Grey prompt
#export PS1="\e[2m[\t]\e[0m $PWD\e[0;31m:\e[0m"

#Blue prompt
#export PS1="\[\e[0;34m\][\t]\[\e[m\] $PWD\e[0;31m:\e[0m"

#Hybrid prompt
export PS1="\[\e[0;34m\][\t]\[\e[m\] \e[1;37m\]$PWD\[\e[m\e[0;31m:\e[0m"

#Hybrid prompt (current directory name only)
#export PS1="\[\e[0;34m\][\t]\[\e[m\] \e[1;37m\](${PWD##*/})\[\e[m\e[0;31m:\e[0m"
# 🦑 🌿 🌲 🌎 🦊 🚀 🦌 ⛺ ⛰ 🏔 🏕 🔥

#Colors
#Black 0;30 Dark Gray 1;30
#Blue 0;34 Light Blue 1;34
#Green 0;32 Light Green 1;32
#Cyan 0;36 Light Cyan 1;36
#Red 0;31 Light Red 1;31
#Purple 0;35 Light Purple 1;35
#Brown 0;33 Yellow 1;33
#Light Gray 0;37 White 1;37

# See https://the.exa.website/
alias ls='exa -bhHl --git'
#alias ls='ls -GFl'

alias ll='exa -bhHl --git'
#alias ll='ls -GFla'

alias la='exa -bhHla --git'
alias dir='exa -bhHla --git'

alias ..='cd ../'
alias ...='cd ../../'

alias filecount="ls -1R | grep -v ^$ | grep -v :$ | wc -l"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles -bool NO; killall Finder"
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles -bool YES; killall Finder"

alias updatefinder="sudo find / -name .DS_Store -delete; killall Finder"
alias updatescreenshots="defaults write com.apple.screencapture location ~/Pictures/Screenshots; killall SystemUIServer"

alias ga="git add ."
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gp="git pull"
alias gs="git status"

alias reload="source ~/.bash_profile"
alias tree="exa --tree"

function cd() {
  command cd "$@";
  # PS1 with full directory path:
   export PS1="\[\e[0;34m\][\t]\[\e[m\] \e[1;37m\]$PWD\[\e[m\e[0;31m:\e[0m"

  command exa -bhHl --git;
  echo -ne '\033]2;'$PWD'\007'
}

function clean() {
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	echo 'Successfully removed all Xcode derived data!'
}

function filetypecount() {
    find . -iname "*.$@" | wc -l
}

function grepcopy() {
    command grep "$@" | pbcopy
    pbpaste
}

function grep() {
    command grep "$@" -A 5 -B 3
}

export PATH="$HOME/.fastlane/bin:$PATH"

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
