# super useful utility for parsing which git branch is present
# git clone "jimeh/git-aware-prompt" into ~/.bash
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# add a path for the go binaries
export PATH=$PATH:/usr/local/go/bin

# tab complete in shell forwards with 'tab' and backwards with 'shift-tab'
bind 'TAB':menu-complete
bind '"\e[Z":menu-complete-backward'

# source a .bash_aliases file if there is one
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# same with ls an ls colors file
if [ -f ~/.ls_colors ]; then
    . ~/.ls_colors
fi

######## UBUNTU DEFAULT OPTIONS ########

# if not running interactively don't do anything
case $- in
    *i*) ;;
      *) return ;;
esac

HISTCONTROL=ignoreboth #don't put duplicate lines or lines starting with space in history

shopt -s histappend # append to history file

HISTSIZE=1000
HISTFILESIZE=2000 # these 2 used for setting the history lenght of the bash history

shopt -s checkwinsize # check and set window size after each command

shopt -s globstar # the pattern ** used in a pathname will expand to match all files or zero or more directories

# allows for some programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make the "less" command more friendly

# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export PATH=$PATH:/home/baiza/.local/bin

#### UBUNTU COLOR SETTINGS ####

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes # allow a colored prompt

# a check for color support
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# set prompt, for default, see /etc/skel/.bashrc
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}'
    #my custom prompt, curtosy of jimeh/git-aware-prompt.git
    PS1+="\[$txtylw\]\u \[$txtblu\]| \[$txtred\]\w \[$txtpur\]\$git_branch\[$txtrst\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)} \u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#### END OF UBUNTU COLOR SETTINGS ####

######## END OF UBUNTU DEFAULT OPTIONS ########

####### SET UP PULSEAUDIO ########
export HOST_IP="$(ip route |awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"
#export DISPLAY="$HOST_IP:0.0"
