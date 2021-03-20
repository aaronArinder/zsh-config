export ZSH="/Users/aaronarinder/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_THEME="agnoster"

# removes computer name
DEFAULT_USER=$(whoami)

# PLUGINS
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# find and load an .nvmrc if it exists (thanks, Avery)
load-nvmrc() {
  if [[ ( -f .nvmrc && -r .nvmrc ) ||
        ( -f ../.nvmrc && -r ../.nvmrc ) ||
        ( -f ../../.nvmrc && -r ../../.nvmrc ) ||
        ( -f ../../../.nvmrc && -r ../../../.nvmrc ) ||
        ( -f ../../../../.nvmrc && -r ../../../../.nvmrc ) ||
        ( -f ../../../../../.nvmrc && -r ../../../../../.nvmrc ) ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default) ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# overload cd to also run load-nvmrc
cd() {
  if [[ $1 == "" ]]; then
    builtin cd && load-nvmrc
  else
    builtin cd "$1" && load-nvmrc
  fi
}

load-nvmrc

if [ -f ~/zsh/aliases ]; then
    . ~/zsh/aliases
fi

if [ -f ~/zsh/uncommittable_aliases ]; then
    . ~/zsh/uncommittable_aliases
fi

if [ -f ~/zsh/hidden_exports ]; then
    . ~/zsh/hidden_exports
fi

#if [ -f ~/bash_scripts/functions/get_weather ]; then
#    . ~/bash_scripts/functions/get_weather
#fi
#
#
#if [ -f ~/.uncommitable_aliases ]; then
#    . ~/.uncommitable_aliases
#fi
#

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/aaronarinder/Edge/pablo/node_modules/tabtab/.completions/slss.zsh

alias python=python3

#export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH"
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH="/usr/local/opt/helm@2/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH=~/.nimble/bin:$PATH

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

. /usr/local/opt/asdf/asdf.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
