if status is-interactive
# Commands to run in interactive sessions can go here
end

alias cfg "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias lcfg "lazygit -g ~/.cfg -w ~"

# 初始化 zoxide 并将 cd 作为 z 的别名，cdi 作为 zi(z interactive) 的别名
zoxide init --cmd cd fish | source
starship init fish | source

fish_config theme choose catppuccin-mocha --color-theme=dark
