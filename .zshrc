# auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# GIT shortcuts
alias gb='git branch'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m"."'
alias gpush='git push origin master'
alias gpull='git pull origin master'

# Docker shortcuts
dps_expand() {
  zle reset-prompt
  LBUFFER="docker ps"
  RBUFFER=""
}
zle -N dps_expand
bindkey "dps" dps_expand

dex_expand() {
  zle reset-prompt
  LBUFFER="docker exec -it "
  RBUFFER=""
}
zle -N dex_expand
bindkey "dex" dex_expand

dcu_expand() {
  zle reset-prompt
  LBUFFER="docker compose up "
  RBUFFER=""
}
zle -N dcu_expand
bindkey "dcu" dcu_expand
