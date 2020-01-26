#
# My zsh theme
# Based on AVIT ZSH Theme
#

#local _prompt_symbol_user='˃'
local _prompt_symbol_user='ᐳ'
local _prompt_symbol_root='ᗒ'

PROMPT='
$(_user_host)${_current_dir}$(_git_current_branch)
%{$fg[$CARETCOLOR]%}$PROMPT_SYMBOL%{$reset_color%} '

RPROMPT='%{$(echotc UP 1)%}${_return_status}%{$(echotc DO 1)%}'

local _current_dir="%{$fg_bold[blue]%}%3~%{$reset_color%} "
local _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

function _current_dir() {
  local _max_pwd_length="65"
  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "%{$fg_bold[blue]%}%-2~ ... %3~%{$reset_color%} "
  else
    echo "%{$fg_bold[blue]%}%~%{$reset_color%} "
  fi
}

function _git_current_branch() {
    local branch_name=$(git_current_branch)
    if [[ -n $branch_name ]]; then
        echo "%{$fg_bold[magenta]%}$branch_name%{$reset_color%}"
    fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
  PROMPT_SYMBOL=$_prompt_symbol_root
else
  CARETCOLOR="white"
  PROMPT_SYMBOL=$_prompt_symbol_user
fi

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

