if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
. ~/.bash_aliases

export  PATH="$HOME/.local/bin:$PATH"
export  PATH="/home/kkpagaev/bin:$PATH"
export  PATH="/home/kkpagaev/go/bin:$PATH"
export  PATH="/home/kkpagaev/.ghcup/bin:$PATH"

export FLYCTL_INSTALL="/home/kkpagaev/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

set -gx PATH "$HOME/.cargo/bin" $PATH;

set -gx PATH "$HOME/.cargo/env" $PATH

export PATH="/usr/local/go/bin:$PATH"

export PATH="/home/kkpagaev/.local/share/nvim/mason/bin:$PATH"
set -gx PATH "/usr/local/" $PATH
set -gx BROWSER "firefox"

bind \ct 'nvim'
bind \cg 'g'

# bind \cz 'fg'

if status --is-interactive
    zoxide init fish | source
end

set -g fish_greeting

export VISUAL=nvim
export EDITOR="nvim"

# set -U fish_user_paths ~/dotfiles/scripts $fish_user_paths

set --universal nvm_default_version v18.16.0

function bang  --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    echo $history[1]
    eval command $history[1]
end

fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

bind \cv edit_command_buffer
