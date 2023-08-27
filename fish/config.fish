#!/usr/bin/fish

##################################
# General
##################################

# Fish Theme Stuff
# See https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#bobthefish
set -g theme_powerline_fonts yes
# set -g theme_color_scheme terminal1-dark
set -g theme_date_format "+%H:%M:%S"

alias ls="exa --color=auto"
alias l="ls -F"
alias ll="ls -l "
alias export="set -gx"
alias mkdir="mkdir -p"
alias tree="exa --tree"

function md -d "display a markdown file in Lynx"
	if test -z $argv[1]
		printf "usage: md <filename>"
		return
	end

	pandoc -fmarkdown -thtml $argv[1] && lynx --stdin
end

# luarocks
export LUA_PATH "/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/thacuber2a03/.luarocks/share/lua/5.4/?.lua;/home/thacuber2a03/.luarocks/share/lua/5.4/?/init.lua"
export LUA_CPATH "/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so;/home/thacuber2a03/.luarocks/lib/lua/5.4/?.so"
export PATH "$HOME/.luarocks/bin:/usr/local/bin:$PATH"

# gem
export GEM_HOME "$HOME/.gems"

# executables
export PATH "$HOME/.cargo/bin:$PATH" # cargo and other rust executables
export PATH "$HOME/.gems/bin:$PATH" # ruby executables
export PATH "$HOME/.local/bin/node.js/bin:$PATH" # node.js (I will personally never use this myself)

# other vars
export EDITOR "$HOME/.local/bin/nvim"
export SHELL (which fish)

export ODIN_ROOT "$HOME/.local/bin/Odin"

export PLAYDATE_SDK_PATH "$HOME/.local/bin/Playdate SDK"

export BUCKLESPRING_WAV_DIR "$HOME/.local/bin/bucklespring/wav"

#if status is-interactive
	# Commands to run in interactive sessions can go here
#end

# uxn roms
set uxnromsloc "$HOME/.local/bin/uxn"
alias donsol="uxnemu -3x $uxnromsloc/donsol.rom"
alias left="uxnemu -2x $uxnromsloc/left.rom"
alias bicycle="uxnemu -2x $uxnromsloc/bicycle.rom"
alias oquonie="uxnemu -2x $uxnromsloc/oquonie.rom"
alias nasu="uxnemu -2x $uxnromsloc/nasu.rom"
alias orcaide="uxnemu $uxnromsloc/orca.rom"
alias uxnlauncher="uxnemu $uxnromsloc/launcher.rom"

function fish_user_key_bindings
	bind \e\[3\;5~ kill-word
end
