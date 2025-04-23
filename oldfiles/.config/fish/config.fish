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

	pandoc -fmarkdown -thtml $argv[1] | lynx --stdin
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
export UXN_ROMS_DIR "$HOME/.local/bin/uxnroms"
alias donsol="uxnemu -3x $UXN_ROMS_DIR/donsol.rom"
alias left="uxnemu -2x $UXN_ROMS_DIR/left.rom"
alias bicycle="uxnemu -2x $UXN_ROMS_DIR/bicycle.rom"
alias oquonie="uxnemu -2x $UXN_ROMS_DIR/oquonie.rom"
alias nasu="uxnemu -2x $UXN_ROMS_DIR/nasu.rom"
alias orcaide="uxnemu $UXN_ROMS_DIR/orca.rom"
alias uxnlauncher="uxnemu $UXN_ROMS_DIR/launcher.rom"
alias dexe="uxnemu $UXN_ROMS_DIR/dexe.rom"

function fish_user_key_bindings
	bind \e\[3\;5~ kill-word
end

# there's no need for this to be here, I just love it so much
function bytebeat -d "play some bytebeat"
	if test -z $argv[1]
		printf "usage: bytebeat <program> [init code]"
		return
	end

	set -l tmpfile (mktemp)
	if test $status -ne 0
		return
	end

	if test -z $argv[2]
		printf "#include <math.h>\nmain(t){for(;;t++)putchar(%s);}" $argv[1] > "$tmpfile"
	else
		printf "#include <math.h>\nmain(t){%sfor(;;t++)putchar(%s);}" $argv[2] $argv[1] > "$tmpfile"
	end
	gcc -xc "$tmpfile" -std=c89 -o "$tmpfile.out"

	if test $status -eq 0
		"$tmpfile.out" | aplay &
		rm "$tmpfile" "$tmpfile.out"
		fg
	else
		rm "$tmpfile" "$tmpfile.out"
	end
end

source /home/thacuber2a03/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end
