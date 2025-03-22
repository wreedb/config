function aur --description "query the aur"
	set -f urlbase "https://aur.archlinux.org/rpc/v5/search"
	set -f urlsuffix "?by=name-desc"
	set -f urlsnapshotbase "https://aur.archlinux.org/cgit/aur.git/snapshot"
	set -f dlclonedir "$HOME/.local/src/arch/aur"
	
	test -z $argv[1]; and return 2
	switch $argv[1]
		case "-s"
			test -z $argv[2]; and return 2
			echo "[aur] *>>> searching for: $argv[2]"
			set -l tmpfile (mktemp)
			curl "$urlbase/$argv[2]$urlsuffix" \
				| jq '.results[] | {name: .Name, desc: .Description}' -C \
				> $tmpfile
			cat $tmpfile
			ov $tmpfile
		case "-i"
			test -z $argv[2]; and return 2
			echo "[aur] *>>> getting info for: $argv[2]"
			set -l tmpfile (mktemp)
			curl "https://aur.archlinux.org/rpc/v5/info?arg[]=$argv[2]" \
				| yq '.results' -CP > $tmpfile
			cat $tmpfile
			ov $tmpfile
			command rm "$tmpfile"
		case "-t"
			test -z $argv[2]; and return 2
			echo "[aur] *>>> downloading snapshot of: $argv[2]"
			set -l tmpfile (mktemp)
			curl "$urlsnapshotbase/$argv[2].tar.gz" -o "$tmpfile"
			tar -C "$dlclonedir" -xvf "$tmpfile"
			command rm "$tmpfile"
			cd "$dlclonedir/$argv[2]"
			eza --long --icons --all --classify=always
		case "-c"
			test -z $argv[2]; and return 2
			echo "[aur] *>>> cloning repository: $argv[2]"
			git clone --depth=1 "https://aur.archlinux.org/$argv[2]" "$dlclonedir/$argv[2]"
			eza --long --icons --all --classify=always "$dlclonedir/$argv[2]"
			cd "$dlclonedir/$argv[2]"
		case "*"
			echo "invalid argument: $argv[1]"
			return 2
	end
end
