if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

. ~/.config/.bash_aliases

export  PATH="$HOME/.local/bin:$PATH"
export  PATH="$HOME/.cargo/bin:$PATH"
export  PATH="$HOME/.config/bin:$PATH"

set -gx PATH "/usr/local/" $PATH
set -gx BROWSER "zen-browser"

if status --is-interactive
    zoxide init fish | source
end

set -g fish_greeting
export VISUAL=nvim
export EDITOR="nvim"
set --universal nvm_default_version v20.11.0

function bang  --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    echo $history[1]
    eval command $history[1]
end

bind \cv edit_command_buffer

bind \ct 'nvim'
bind \cg 'g'

export FLYCTL_INSTALL="/home/kkpagaev/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kkpagaev/.ghcup/bin $PATH # ghcup-env

~/.local/bin/mise activate fish | source

# eval "$(rbenv init -)"

