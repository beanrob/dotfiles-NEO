# vim: filetype=sh

#   __ _     _
#  / _(_)___| |__  _ __ ___
# | |_| / __| '_ \| '__/ __|
# |  _| \__ \ | | | | | (__
# |_| |_|___/_| |_|_|  \___|

# FISH FUNCTIONS -------------------------------------------------------------------------- {{{
function fish_prompt
	#echo -e "[\e[3m$USER\e[0m@\e[3m$HOSTNAME\e[0m:\e[3m$(prompt_pwd)\e[0m] \$ "
    echo
    echo $(pwd)
    echo -e "\e[3m$USER\e[0m @ \e[3m$HOSTNAME\e[0m \$ "
end

function fish_right_prompt
	echo -e (set_color white)"[\e[3m"(date '+%H:%M:%S')"\e[0m]"
end

function fish_greeting
end

# for when you forget to type sudo
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
# }}}

# VARIABLES ------------------------------------------------------------------------------- {{{
export HOSTNAME="thonkbook-neo"

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export SUDO_PROMPT="What's the secret password, $USER? "

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/bean/.ghcup/bin # ghcup-env
# }}}

# XDG-NINJA CLEANUP ----------------------------------------------------------------------- {{{
export ANDROID_HOME="$XDG_DATA_HOME"/android
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export GOPATH="$XDG_DATA_HOME"/go

alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
# }}}

# PATH ------------------------------------------------------------------------------------ {{{
set PATH $HOME/.local/bin $HOME/.cargo/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin $HOME/.local/lua-language-server/bin $HOME/.local/share/gem/ruby/3.0.0/bin $GOPATH/bin
# }}}

# THEME ----------------------------------------------------------------------------------- {{{
fish_config theme choose "fish default"
# }}}

# ALIASES & APPLICATIONS ------------------------------------------------------------------ {{{
# Applications
alias top="htop"
alias fm="ranger"
export TERM="alacritty"
export MUSICPLAYER="$TERM -e ncmpcpp"
export BROWSER="firefox"
export EDITOR=vim
export VISUAL=vim

alias x="startx"

# Pacman
alias pac-update="yay -Syu"
alias pac-count="yay -Q | wc -l"
alias pac-autoremove="yay -Qdtq | yay -Rs -"
alias pac-clear="yay -Scc"
alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# Output security codes
alias ghcode="cat ~/docs/0\ IMPORTANT/GITHUB\ TOKEN"
alias pypicode="cat ~/docs/0\ IMPORTANT/PYPI\ TOKEN"

# Replace base commands with exa
alias ls="exa -h --icons --no-permissions"
alias ld="exa -hD --icons --no-permissions"
# alias tree=exa -a --icons --tree		# Shows hidden files
alias tree="exa --icons --tree"			# Doesn't show hidden files

# Confirm before doing the thing
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias ln="ln -i"

# Misc
alias catsay="cowsay -f cat-peekaboo"
alias dnd="dragon-drop"
# }}}

# AUTO START X ---------------------------------------------------------------------------- {{{
if test -z "$DISPLAY"
	figlet "Welcome" | lolcat -F 0.3
	if test "$XDG_VTNR" -eq "1"
		echo -en "Loading X Window System..."
		exec startx
	else
		echo -e "Loading Fish Shell...\n"
	end
end
# }}}
