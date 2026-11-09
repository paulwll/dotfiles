autoload -U compinit
compinit
setopt COMPLETE_IN_WORD

export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"

cr() {
	cc -Wall -Wextra -Werror "$@" && ./a.out
}

cs() {
	cc -Wall -Wextra -Werror -fsanitize=address,undefined "$@" && ./a.out
}

if [[ "$(uname -s)" == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export PATH="/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"
fi
