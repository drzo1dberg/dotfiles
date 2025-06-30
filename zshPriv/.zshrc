# Set path if required
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export EDITOR='nvim'
. "$HOME/.cargo/env"
export PATH="$PATH:/usr/local/go/bin"
export PATH=$PATH:/var/lib/flatpak/exports/bin
export PATH=/home/michael/.local/bin:$PATH
export MANPAGER="nvim +Man!"
# Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases 
fi

autoload -Uz promptinit
promptinit
prompt adam1            # see Zsh Prompt Theme below

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

setopt histignorealldups sharehistory

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose


