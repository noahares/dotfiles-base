HISTSIZE=10000
SAVEHIST=20000
setopt autocd extendedglob nomatch appendhistory histexpiredupsfirst
unsetopt beep notify
bindkey -v
zstyle :compinstall filename '/home/ares/.config/zsh/.zshrc'

autoload -Uz compinit vcs_info
compinit

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'
export PROMPT="%F{#fabd2f}%~%f \$vcs_info_msg_0_ $ "

source $ZDOTDIR/aliases
(cat ~/.cache/wal/sequences &)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
