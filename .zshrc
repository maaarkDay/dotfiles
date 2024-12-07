# shortcuts
alias K="cd ~/Kohost/drivers"
alias P="cd ~/Projects"
alias ls="ls -A"

# Ensures tab cycles through current dir
autoload -Uz compinit
compinit

# auto-suggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
PROMPT='%~ %# '

# Uses tab to complete auto-suggestions while still letting tab scroll through dir
bindkey '^I' autosuggest-accept
bindkey -M emacs '^I' complete-word
