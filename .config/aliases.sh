#!/usr/bin/env zsh

alias aliases='nvim $HOME/.config/aliases.sh'
alias customs='vim $HOME/.config/scripts/custom.sh'
alias realias='source $HOME/.config/aliases.sh'
alias vim=nvim
alias vi=nvim
alias cat=bat
alias ll='ls -lah'
alias rep='pbpaste | pbcopy'
alias k=kubectl

# vault login
function revault {
  export VAULT_ADDR=http://nuc01:8200
  export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.secret/vault.json
	vault login -method=gcp role=vault credentials=/Users/jazz/.secret/@vault.json project=home-214701 service_account=vault-694@home-214701.iam.gserviceaccount.com
}

# tools
alias tf=terraform
alias k=kubectl
