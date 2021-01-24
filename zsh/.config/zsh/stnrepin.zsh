#
# My zsh theme
#

local _prompt_user='ᐳ'
local _prompt_err_ec='⍉'

local _return_status="%{$fg_bold[red]%}%(?..$_prompt_err_ec)%{$reset_color%}"

function _current_dir() {
  local _max_pwd_length="100"
  if [[ ${#PWD} -gt ${_max_pwd_length} ]]; then
    echo "%{$fg_bold[blue]%}%-2~ ... %3~%{$reset_color%} "
  else
    echo "%{$fg_bold[blue]%}%~%{$reset_color%} "
  fi
}

PROMPT="
$(_current_dir)
%{%(!.%F{red}.%F{white})%}$_prompt_user%{$reset_color%} "

RPROMPT="%{$(echotc UP 1)%}$_return_status%{$(echotc DO 1)%}"

