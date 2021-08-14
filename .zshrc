export ZSH="/home/swalawaga/.oh-my-zsh"
ZSH_THEME="gentoo"
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

#no confirm last command
#setopt no_hist_verify

#wal -i "/home/swalawaga/Documents/wallpapers/$(ls -1 /home/swalawaga/Documents/wallpapers | rofi -dmenu)" 
#Better version of i3 config

#My stuff

export PATH=~/.local/bin:$PATH
alias l='exa -lah --group-directories-first --color=always'
alias packagelist='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)'
function flash() {
    sudo dd status=progress if=$1 of=$2
}
function brightness() {
    echo $1 > /sys/class/backlight/amdgpu_bl0/brightness
}
