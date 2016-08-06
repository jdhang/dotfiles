#➤ ᐅ⮀⮂▶◀⮁⮃
#
# vim:ft=zsh ts=2 sw=2 sts=2
#
# Based on agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# Based on ranman's Theme - https://github.com/ranman/oh-my-zsh/blob/master/themes/ranman.zsh-theme
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

setopt promptsubst

autoload -U add-zsh-hook

# RPROMPT='$(git_prompt_info)$(git_prompt_status)%{$reset_color%}%f'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}⮂%{$reset_color%}%{$bg[green]%}%{$fg[white]%}⭠"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%f"
# ZSH_THEME_GIT_PROMPT_CLEAN=" $FG[077]✔%f"

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='\ue0b0'
RIGHT_SEGMENT_SEPARATOR='\ue0b2'
SEGMENT_SEPARATOR_SKINNY='⮁'
SEGMENT_SEPARATOR_LEFT='⮂ '
DIRTY=' ✘'
CLEAN=' ✔'
PLUSMINUS="\u00b1"
BRANCH="\ue0a0 "
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"


prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_right_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}$RIGHT_SEGMENT_SEPARATOR%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

prompt_start() {
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  CURRENT_BG=$1
  if [[ -n $CURRENT_BG ]]; then
    echo -n "%{%k%F{$CURRENT_BG}%}$RIGHT_SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}$RIGHT_SEGMENT_SEPARATOR"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=$1
}


 prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY=$DIRTY
    ZSH_THEME_GIT_PROMPT_CLEAN=$CLEAN
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ $dirty = $DIRTY ]]; then
      prompt_start yellow
      prompt_right_segment yellow black
    else
      prompt_start green
      prompt_right_segment green white
    fi
    echo -n " ${ref/refs\/heads\//$BRANCH}$dirty "
    # echo -n "${ref/refs\/heads\/}$dirty "
  fi
}

prompt_user() {
  prompt_segment black white ' %n '
}

prompt_dir() {
  prompt_segment cyan white ' %3c '
}

prompt_time() {
  prompt_segment blue white '%T '
}

build_prompt() {
  RETVAL=$?
  prompt_time
  prompt_user
  prompt_dir
  prompt_end
}

build_right_prompt() {
  prompt_git
}

RPROMPT='$(build_right_prompt)'
PROMPT='$(build_prompt) '
