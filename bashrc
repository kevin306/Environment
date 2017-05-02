# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[m\]\[\033[1;35m\]\t\[\033[m\]\[\e[1;31m\]\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\~:\w\$ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls --color=auto'
alias vi=vim
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias h='history'
alias cd..='cd ..'
alias grep-ch='grep -rni --include=*.[c,h]'
alias create_cscope_db='bash /home/kevin/ownCloud/docs/scripts/create_cscope_database.sh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Make git shortcuts in .gitconfig aware of 'g' alias for git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g

#set default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

export PATH=$PATH:/home/kevin/.arduino15/packages/Intel-Test/tools/arc-elf32/1.6.4+1.0/bin
export PATH=/opt/idea/bin:$PATH
export UBIWORX_LOCAL_REPO_PATH=/home/kevin/ownCloud/chameleon/repos/cougar/

export SSH_AUTH_SOCK=0
export CSCOPE_DB=~/ownCloud/old_projects/mint_river/mint_river-bsp/cscope.out
export CSCOPE_EDITOR=`which vim`
export VIMRUNTIME=/usr/share/vim
# GDB
export HISTSIZE=100000000

# Mint river QMSI
export ISSM_TOOLCHAIN=/home/kevin/ownCloud/old_projects/mint_river/tools/issm-toolchain-linux-2017-02-07
export IAMCU_TOOLCHAIN_DIR=~/ownCloud/old_projects/mint_river/tools/compiler/gcc-ia/5.2.1/bin
export ARCMCU_TOOLCHAIN_DIR=~/ownCloud/old_projects/mint_river/tools/compiler/gcc-arc/4.8.5/bin
export TINYCRYPT_SRC_DIR=~/ownCloud/old_projects/mint_river/tools/tinycrypt/tinycrypt-0.2.0
export ISSM_TOOLCHAIN_GCC_IA_ROOT=~/ownCloud/old_projects/mint_river/tools/compiler/gcc-ia/5.2.1
export ISSM_TOOLCHAIN_GCC_ARC_ROOT=~/ownCloud/old_projects/mint_river/tools/compiler/gcc-arc/4.8.5
export ZEPHYR_BASE=~/ownCloud/old_projects/mint_river/repos/zephyr/public
export QMSI_SRC_DIR=~/ownCloud/old_projects/mint_river/repos/mint_river-bsp
export QM_BOOTLOADER_DIR=~/ownCloud/old_projects/mint_river/repos/mint_river-qm-bootloader
export ISSM_INSTALLATION_PATH=~/ownCloud/old_projects/mint_river

# Commented Out
#----------------------------
#: <<'stop_comment'
# Mint-river-scripts
alias vm_available='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/vm_availability/vm_availability.py'
# Compiling
alias d2000_rom='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_d2000_rom.py'
alias d2000_bm='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_d2000_bm.py'
alias d2000_zephyr='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_d2000_zephyr.py'
alias se_rom='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_se_rom.py'
alias se_lmt_bm='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_se_x86_bm.py'
alias se_lmt_zephyr='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_se_x86_zephyr.py'
alias se_arc_bm='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_se_sensor_bm.py'
alias se_arc_zephyr='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/compiling/quark_se_sensor_zephyr.py'
# Flashing
alias rom='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/flashing/flash_rom.py'
alias bin='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/flashing/flash_bin.py'
alias command='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/flashing/openocd_commands.py'
alias restart='python ~/ownCloud/old_projects/mint_river/repos/mint_river-scripts/flashing/restart_openocd.py'
#stop_comment
#----------------------------

# Ubiworx installing/building scripts
alias build_ubiworx='bash ~/ownCloud/chameleon/repos/install_scripts/build.sh'
alias update_ubiworx='bash ~/ownCloud/chameleon/repos/install_scripts/update_ubiworx.sh'

 # Compile for x86_64
export PLATFORM=deb_amd64

# Set tab title
function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}
