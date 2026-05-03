# Lightweight zsh setup for OpenWrt.

export ZSH="${HOME}/.oh-my-zsh"

HISTFILE="/tmp/.zsh_history-${USER:-root}"
HISTSIZE=1000
SAVEHIST=1000

setopt auto_cd
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt no_beep

autoload -Uz colors
colors

PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%~%{$reset_color%} %# '

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

ZSH_COMPDUMP="/tmp/.zcompdump-${USER:-root}"
ZSH_DISABLE_COMPFIX=true
rm -f "${HOME}"/.zcompdump "${HOME}"/.zcompdump-*(N) 2>/dev/null

_zsh_lazy_compinit() {
  unfunction _zsh_lazy_compinit 2>/dev/null

  if [[ -d "${ZSH}/custom/plugins/zsh-completions/src" ]]; then
    fpath=("${ZSH}/custom/plugins/zsh-completions/src" $fpath)
  fi

  autoload -Uz compinit
  compinit -C -d "${ZSH_COMPDUMP}"

  zstyle ':completion:*' menu select
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

  bindkey '^I' expand-or-complete
  zle expand-or-complete
}
zle -N _zsh_lazy_compinit
bindkey '^I' _zsh_lazy_compinit

if [[ -r "${ZSH}/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "${ZSH}/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "${ZSH}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${ZSH}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
