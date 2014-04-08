# bash completion for spring
# Installation: source this file locally in a terminal or from
# ~/.bashrc or put it in /etc/bash_completions.d (debian) or in
# /usr/local/etc/bash_completion.d on a Mac with Homebrew
#
# Dependencies: _filedir from bash-completion

# The rake helpers were taken from https://gist.github.com/turadg/840663/raw/46cceea5bc1f73098fcf5e099d91744b24dabdc7/rake.sh

function _rake_cache_path() {
  # If in a Rails app, put the cache in the cache dir
  # so version control ignores it
  if [ -e 'tmp/cache' ]; then
    prefix='tmp/cache/'
  fi
  echo "${prefix}.rake_t_cache"
}

function rake_cache_store() {
  rake --tasks --silent > "$(_rake_cache_path)"
}

function rake_cache_clear() {
  rm -f .rake_t_cache
  rm -f tmp/cache/.rake_t_cache
}

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

function _rakecomplete() {
  # error if no Rakefile
  if [ ! -e Rakefile ]; then
    echo "missing Rakefile"
    return 1
  fi

  # build cache if missing
  if [ ! -e "$(_rake_cache_path)" ]; then
    rake_cache_store
  fi

  local tasks=`awk '{print $2}' "$(_rake_cache_path)"`
  COMPREPLY=($(compgen -W "${tasks}" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}

_spring()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}
  COMPREPLY=( $(compgen -W "binstub help status stop rails rake rspec" -- $cur) )
  if [[ "$prev" == "rails" ]]; then
    COMPREPLY=( $(compgen -W "console runner generate destroy" -- $cur) )
    return
  fi
  if [[ "$prev" == "rspec" ]]; then
    _filedir
    return
  fi
  if [[ "$prev" == "rake" ]]; then
    _rakecomplete
    return
  fi
} && complete -F _spring spring
