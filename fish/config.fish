#!/usr/bin/fish

##################################
# General
##################################

# Fish Theme Stuff
# See https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#bobthefish
set -g theme_powerline_fonts yes
# set -g theme_color_scheme terminal1-dark
set -g theme_date_format "+%H:%M:%S"

alias l="ls -aF"
alias export="set -gx"

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

export PATH "$HOME/.local/bin/furnace:$PATH" # furnace

export PATH "$HOME/.local/bin/cool-retro-term:$PATH" # cool retro term

# other vars
export EDITOR "$HOME/.local/bin/nvim"
export SHELL (which fish)

export ODIN_ROOT "$HOME/.local/bin/Odin"

export PLAYDATE_SDK_PATH "$HOME/.local/bin/Playdate SDK"

#if status is-interactive
	# Commands to run in interactive sessions can go here
#end

# uxn roms
set uxnromsloc "$HOME/roms"
alias donsol="uxnemu -3x $uxnromsloc/donsol.rom"
alias left="uxnemu -2x $uxnromsloc/left.rom"
alias bicycle="uxnemu -2x $uxnromsloc/bicycle.rom"

function fish_user_key_bindings
	bind \e\[3\;5~ kill-word
end
