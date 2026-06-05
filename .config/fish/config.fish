if status is-interactive
# Commands to run in interactive sessions can go here
end

alias cfg "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias lcfg "lazygit -g ~/.cfg -w ~"
alias ls "eza --icons --git-repos-no-status --header"
alias cat "bat"
alias ff "fastfetch"
alias mwin "sudo mount /dev/nvme0n1p1 ~/win-data -t ntfs-3g"

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

# 初始化 zoxide 并将 cd 作为 z 的别名，cdi 作为 zi(z interactive) 的别名
zoxide init --cmd cd fish | source
starship init fish | source
# batpipe 可以让 less 命令有高亮效果
eval (batpipe)
batman --export-env | source

fish_config theme choose catppuccin-mocha --color-theme=dark
