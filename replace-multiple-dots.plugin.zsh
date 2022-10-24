#!/usr/bin/env zsh

REPLACE_MULTIPLE_DOTS_IGNORE="${REPLACE_MULTIPLE_DOTS_IGNORE:-^go }"

__replace_multiple_dots() {
  if [[ "$LBUFFER" =~ '(^|[/ ])\.\.$' ]] && [[ ! "$LBUFFER" =~ "$REPLACE_MULTIPLE_DOTS_IGNORE" ]]; then
    LBUFFER=$LBUFFER[1,-3]'../.'
  fi
  zle self-insert
}
__insert_dot() {
    LBUFFER+='.'
}

zle -N __replace_multiple_dots
zle -N __insert_dot
bindkey "." __replace_multiple_dots
bindkey "^X." __insert_dot
