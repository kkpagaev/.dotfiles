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
set -gx PATH "$HOME/.cargo/bin" $PATH;

export PATH="/usr/local/go/bin:$PATH"

export PATH="/home/kkpagaev/.local/share/nvim/mason/bin:$PATH"
# pnpm
set -gx PNPM_HOME "/home/kkpagaev/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
set -gx PATH "/usr/local/" $PATH
# pnpm end

export PACKER_PATH="/home/kkpagaev/.local/share/nvim/site/pack/packer/start"

fish_add_path /home/kkpagaev/.spicetify

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kkpagaev/.ghcup/bin $PATH # ghcup-env
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kkpagaev/.ghcup/bin $PATH # ghcup-env

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/kkpagaev/.ghcup/bin $PATH # ghcup-env
