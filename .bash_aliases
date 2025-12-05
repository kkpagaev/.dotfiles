alias fly="flyctl"

alias dev="yarn run dev"
alias dc="docker-compose"
alias d="docker"
alias dup="docker-compose up -d"

alias ld="lazydocker"
alias lg="lazygit"

alias c="clear -x"
alias e="nvim -n -i NONE"
alias vi="nvim -n -i NONE"

alias d="docker"

alias clip="wl-copy"

alias l="less"
alias q="exit"
alias pa="php artisan"

alias baobab="baobab"

alias o="zi"
alias p="zi \$(git rev-parse --show-toplevel)/packages/"
alias a="zi \$(git rev-parse --show-toplevel)/apps/"
alias u="cd -"

alias g='nvim -c "silent Git " -c "wincmd o"'
alias findc="find ~/.config/wpaperd ~/.config/sway/ ~/.config/foot/ ~/.config/tmux/ ~/.config/nvim/ ~/.config/kitty/ ~/.config/alacritty/ ~/.config/fish/ ~/.tmux.conf ~/.bashrc ~/.bash_aliases -not -path '*/.git/*' -not -path '*/copilot.vim/*'"
alias findc="find ~/.config/wpaperd ~/.config/sway/ ~/.config/foot/ ~/.config/tmux/ ~/.config/nvim/ ~/.config/kitty/ ~/.config/alacritty/ ~/.config/fish/ ~/.tmux.conf ~/.bashrc ~/.bash_aliases -not -path '*/.git/*' -not -path '*/copilot.vim/*'"
alias fc="nvim \$(findc -type f | fzf)"
alias fdc="nvim \$(find ~ -maxdepth 4 -name 'docker-compose.*' | fzf --preview 'pygmentize -g {}')"
alias fdf="nvim \$(find ~ -maxdepth 4 -name 'Dockerfile' | fzf --preview 'pygmentize -g {}')"

alias gr="google-chorme-stable \$(git remote -v | head -n 1 |  awk '{ print \$2 }' | sed 's/git@personal/git@github.com/' | sed 's/.git//g' | sed 's,:,/,')"

alias tk="tmux kill-session -t \$(tmux display-message -p '#S')"

alias icat="kitty +kitten icat"
alias rails="docker-compose exec app rails"
alias de="docker-compose exec app bash"
