if [ -n "$TTY" ]; then
	export GPG_TTY=$(tty)
else
	export GPG_TTY="$tty"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
# Source/Load zinitsource "${ZINIT_HOME}/zinit.zsh"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"

# Add in Powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"
eval # ============================================================================= # # Utility functions for zoxide. # # pwd based on the value of _ZO_RESOLVE_SYMLINKS. function __zoxide_pwd() { uiltin pwd -L } # cd + custom logic based on the value of _ZO_ECHO. function __zoxide_cd() { # shellcheck disable=SC2164 uiltin cd -- "$@" } # ============================================================================= # # Hook configuration for zoxide. # # Hook to add new entries to the database. function __zoxide_hook() { # shellcheck disable=SC2312
alias cd=z
alias ls="eza --color=always --long --icons=always --no-time --no-permissions --no-user"

path+=('/usr/local/bin')
export PATH
export DENO_INSTALL="/Users/nwpoo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
alias zb=zig build run
export GPG_TTY=$(tty)
export PATH=/home/nwpo/.nimble/bin:/Users/nwpoo/.deno/bin:/home/nwpo/.local/share/zinit/polaris/bin:/home/nwpo/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/bin
export GPG_TTY=$(tty)
  export FLYCTL_INSTALL="/home/nwpo/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"

. "/home/lazy/.cargo/env"

export PATH=/home/lazy/.nimble/bin:$PATH

# bun completions
[ -s "/home/lazy/.bun/_bun" ] && source "/home/lazy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.cargo/env"
