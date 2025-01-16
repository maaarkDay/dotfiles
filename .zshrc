# auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# remap tab key to autocomplete instead of right arrow
bindkey '^I' autosuggest-accept

# send message to someone via slack 
alias slack="~/Projects/slack/send-msg.sh"

# navigate to most used directories
alias K="cd ~/Kohost/drivers"
alias P="cd ~/Projects"
alias ls="ls -A"
alias n="nvim ."
