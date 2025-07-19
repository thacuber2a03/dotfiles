# function fish_title
# 	echo $argv[1] (prompt_pwd)
# 	pwd
# end

if status is-interactive
	alias ls 'eza --icons=auto'
	alias ll 'ls -al'
	alias tree 'ls --tree'
	alias mkdir 'mkdir -p'
	alias export 'set -gx'

	export fish_greeting ""

	function md -d "display a markdown file in Lynx"
		if test -z $argv[1]
			printf "usage: md <filename>\n"
			return
		end
		pandoc -fmarkdown -thtml $argv[1] | lynx --stdin
	end

	fish_vi_key_bindings

	export PATH "$HOME/.local/bin:$PATH"

	export LUA_PATH "$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;;"
	export LUA_CPATH "$HOME/.luarocks/lib/lua/5.1/?.so;;"
	export PATH "$HOME/.luarocks/bin:$PATH"

	# windos :pensive:
	# NO MORE WINDOS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	# export USERPROFILE "/mnt/c/Users/thacuber2a03"
	# export PATH "/mnt/c/Program Files/LOVE:$PATH"
	# export PATH "/mnt/c/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.44.35207/bin/Hostx64/x64:$PATH"
	# export PATH "$USERPROFILE/AppData/Local/Programs:$PATH"

	export EDITOR (command -s kak)
	export PAGER  (command -s kak)

	# I can't recall why I had this but eh
	export SHELL (command -v fish)

	# ...not too sure of this...
	# export PLAYDATE_SDK_PATH "$USERPROFILE/Documents/PlaydateSDK"

	export LESS "--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=-4"

	# uxn roms

	# I don't use uxn as often nowadays,
	# but it's still nice to have this
	# I don't have this folder on my system though, so...

	export UXN_ROMS_DIR "$HOME/.local/bin/uxnroms"
	# alias donsol="uxnemu -3x $UXN_ROMS_DIR/donsol.rom"
	# alias left="uxnemu -2x $UXN_ROMS_DIR/left.rom"
	# alias bicycle="uxnemu -2x $UXN_ROMS_DIR/bicycle.rom"
	# alias oquonie="uxnemu -2x $UXN_ROMS_DIR/oquonie.rom"
	# alias nasu="uxnemu -2x $UXN_ROMS_DIR/nasu.rom"
	# alias orcaide="uxnemu $UXN_ROMS_DIR/orca.rom"
	# alias uxnlauncher="uxnemu $UXN_ROMS_DIR/launcher.rom"
	alias dexe="uxnemu -2x $UXN_ROMS_DIR/dexe.rom"

	starship init fish | source
	zoxide init fish | source

	# (copied verbatim from the old config.fish)
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
end

