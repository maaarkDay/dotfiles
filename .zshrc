alias gb='git branch'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m"."'
alias gpush='git push origin master'
alias gpull='git pull origin master'

# Docker shortcuts
de_expand() {
  zle reset-prompt
  LBUFFER="docker exec -it "
  RBUFFER=""
}
zle -N de_expand
bindkey "de" de_expand
