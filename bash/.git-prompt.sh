# ------------------------------------------------------------------------------
# HELPERS
# Helpers for common used actions
# ------------------------------------------------------------------------------

# Check if command exists in $PATH
# USAGE:
#   _exists <command>
_exists() {
  command -v $1 > /dev/null 2>&1
}

# Check if the current directory is in a Git repository.
# USAGE:
#   _is_git
_is_git() {
  command git rev-parse --is-inside-work-tree &>/dev/null
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Get the status of the working tree
function git_prompt_status() {
  local INDEX STATUS
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi
  echo $STATUS
}

# Draw prompt section (bold is used as default)
# USAGE:
#   _prompt_section <color> [prefix] <content> [suffix]
SPACESHIP_OPENED=false # Internal variable for checking if prompt is opened
_prompt_section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  # echo -n "%{%B%}" # set bold
  echo -n "\e[1m" # bold
  if [[ $SPACESHIP_OPENED == true ]] && [[ $SPACESHIP_PROMPT_PREFIXES_SHOW == true ]]; then
    echo -n "$prefix"
  fi
  SPACESHIP_OPENED=true
  # echo -n "%{%b%}" # unset bold
  echo -n "\[\e[m\]" # unset bold

  # echo -n "%{%B$color%}" # set color
  echo -n "$color" # set color
  echo -n "$content"     # section content
  # echo -n "%{%b%f%}"     # unset color
  echo -n "\[\e[m\]" # unset color

  echo -n "\e[1m" # bold
  # echo -n "%{%B%}" # reset bold, if it was diabled before
  if [[ $SPACESHIP_PROMPT_SUFFIXES_SHOW == true ]]; then
    echo -n "$suffix"
  fi
  # echo -n "%{%b%}" # unset bold
  echo -n "\[\e[m\]" # unset bold
}

# COLORS
MAGENTA="\e[35m"
RED="\e[31m"
YELLOW="\e[33m"
BOLD="\e[1m"
RESET="\e[0m"

SPACESHIP_PROMPT_DEFAULT_SUFFIX=""
# GIT
SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW:=true}"
# SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX:="on "}"
SPACESHIP_GIT_PREFIX="on "
# SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
# SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL:=" "}"
# SPACESHIP_GIT_SYMBOL=" "
SPACESHIP_GIT_SYMBOL="["
# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW:=true}"
# SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX:="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
# SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX}"
# SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR:="magenta"}"
SPACESHIP_GIT_BRANCH_COLOR="${MAGENTA}"
# GIT STATUS
SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW:=true}"
# SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX:="["}"
# SPACESHIP_GIT_STATUS_PREFIX="["
SPACESHIP_GIT_STATUS_PREFIX="|"
# SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX:="]"}"
SPACESHIP_GIT_STATUS_SUFFIX="]"
# SPACESHIP_GIT_STATUS_COLOR="${SPACESHIP_GIT_STATUS_COLOR:="red"}"
SPACESHIP_GIT_STATUS_COLOR="${RED}"
# SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED:="?"}"
# SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED:="+"}"
# SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED:="!"}"
# SPACESHIP_GIT_STATUS_RENAMED="${SPACESHIP_GIT_STATUS_RENAMED:="»"}"
# SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED:="✘"}"
# SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED:="$"}"
# SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED:="="}"
# SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD:="⇡"}"
# SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND:="⇣"}"
# SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED:="⇕"}"

SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# GIT BRANCH
# Show current git brunch using git_current_status from Oh-My-Zsh
spaceship_git_branch() {

  _is_git || return

  local current_branch="$(git_current_branch)"

  # _prompt_section \
    # "$SPACESHIP_GIT_BRANCH_COLOR" \
    # "$SPACESHIP_GIT_BRANCH_PREFIX$(git_current_branch)$SPACESHIP_GIT_BRANCH_SUFFIX"
  echo -e "${BOLD}${YELLOW}${SPACESHIP_GIT_BRANCH_PREFIX}${SPACESHIP_GIT_BRANCH_COLOR}${current_branch}${SPACESHIP_GIT_BRANCH_SUFFIX}"
}

# GIT STATUS
# Check if current dir is a git repo, set up ZSH_THEME_* variables
# and show git status using git_prompt_status from Oh-My-Zsh
# Reference:
#   https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
spaceship_git_status() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  _is_git || return

  ZSH_THEME_GIT_PROMPT_UNTRACKED=$SPACESHIP_GIT_STATUS_UNTRACKED
  ZSH_THEME_GIT_PROMPT_ADDED=$SPACESHIP_GIT_STATUS_ADDED
  ZSH_THEME_GIT_PROMPT_MODIFIED=$SPACESHIP_GIT_STATUS_MODIFIED
  ZSH_THEME_GIT_PROMPT_RENAMED=$SPACESHIP_GIT_STATUS_RENAMED
  ZSH_THEME_GIT_PROMPT_DELETED=$SPACESHIP_GIT_STATUS_DELETED
  ZSH_THEME_GIT_PROMPT_STASHED=$SPACESHIP_GIT_STATUS_STASHED
  ZSH_THEME_GIT_PROMPT_UNMERGED=$SPACESHIP_GIT_STATUS_UNMERGED
  ZSH_THEME_GIT_PROMPT_AHEAD=$SPACESHIP_GIT_STATUS_AHEAD
  ZSH_THEME_GIT_PROMPT_BEHIND=$SPACESHIP_GIT_STATUS_BEHIND
  ZSH_THEME_GIT_PROMPT_DIVERGED=$SPACESHIP_GIT_STATUS_DIVERGED

  local git_status="$(git_prompt_status)"

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    # _prompt_section \
      # "$SPACESHIP_GIT_STATUS_COLOR" \
      # "$SPACESHIP_GIT_STATUS_PREFIX$git_status$SPACESHIP_GIT_STATUS_SUFFIX"
    # echo "${SPACESHIP_GIT_STATUS_COLOR} ${SPACESHIP_GIT_STATUS_PREFIX}${git_status}${SPACESHIP_GIT_STATUS_SUFFIX}"
    echo -e "${YELLOW}${SPACESHIP_GIT_STATUS_PREFIX}${SPACESHIP_GIT_STATUS_COLOR}${git_status}${YELLOW}${SPACESHIP_GIT_STATUS_SUFFIX}${RESET}"
  fi
}

# GIT
# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status
# Similar to _prompt_section
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  local git_branch="$(spaceship_git_branch)" git_status="$(spaceship_git_status)"

  [[ -z $git_branch ]] && return

  # _prompt_section \
    # 'white' \
    # "$SPACESHIP_GIT_PREFIX" \
    # "${git_branch}${git_status}" \
    # "$SPACESHIP_GIT_SUFFIX"
  echo -e "${BOLD}${SPACESHIP_GIT_PREFIX}${git_branch}${git_status}${SPACESHIP_GIT_SUFFIX}${RESET} "
}
