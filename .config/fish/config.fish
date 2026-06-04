if status is-interactive
# Commands to run in interactive sessions can go here
end

alias cfg "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias lcfg "lazygit -g ~/.cfg -w ~"
alias ls "eza --icons --no-user --git-repos-no-status --header"

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

fish_config theme choose catppuccin-mocha --color-theme=dark
