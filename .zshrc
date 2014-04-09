# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/max/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PROMPT="%~ $ "
export PATH=/usr/local/bin:$PATH
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Rails
export POSTGRES_USER="max"
export POSTGRES_PASSWORD=""
export RAILS_SECRET_KEY_BASE="e3eed9b53e553b4cac1dd995433a02b09599ce0f26c5a3d33e57fb75f23bc0e1f17d378943789312e3a3ee410fed846860b2e4e944b8623d878663a51171c133"

# Command correction
setopt CORRECT
source /Users/max/.aliases

setopt   appendhistory
setopt   incappendhistory     # New history lines are added to the $HISTFILE incrementally (as soon as
                              # they are entered), rather than waiting until the shell is killed

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
