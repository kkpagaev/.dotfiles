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

set --universal nvm_default_version v20.11.0

function bang  --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    echo $history[1]
    eval command $history[1]
end

fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.julia/juliaup/julia-1.10.2+0.x64.linux.gnu/bin

bind \cv edit_command_buffer

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kkpagaev/.ghcup/bin $PATH # ghcup-env

export PATH="$HOME/opt/openmpi/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/opt/openmpi/lib"

export GO111MODULE="on" 

source /opt/asdf-vm/asdf.fish


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

source /home/kkpagaev/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

export ERL_AFLAGS="-kernel shell_history enabled"
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

source ~/.phpbrew/phpbrew.fish
# source ~/gitlab/python/.venv/bin/activate.fish
#
# function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
#   status --is-command-substitution; and return
#
#   # Check if we are inside a git directory
#   if git rev-parse --show-toplevel &>/dev/null
#     set gitdir (realpath (git rev-parse --show-toplevel))
#     set cwd (pwd -P)
#     # While we are still inside the git directory, find the closest
#     # virtualenv starting from the current directory.
#     while string match "$gitdir*" "$cwd" &>/dev/null
#       if test -e "$cwd/.venv/bin/activate.fish"
#         source "$cwd/.venv/bin/activate.fish" &>/dev/null 
#         return
#       else
#         set cwd (path dirname "$cwd")
#       end
#     end
#   end
#   # If virtualenv activated but we are not in a git directory, deactivate.
#   if test -n "$VIRTUAL_ENV"
#     deactivate
#   end
# end
