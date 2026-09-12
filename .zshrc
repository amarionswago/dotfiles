case ":$PATH:" in
	*:"$HOME/.local/bin":*) ;;
	*) export PATH="$HOME/.local/bin:$PATH" ;;
esac

case ":$PATH:" in
	*:"$HOME/.local/share/nvim/mason/bin":*) ;;
	*) export PATH="$HOME/.local/share/nvim/mason/bin:$PATH" ;;
esac

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
mkdir -p "${HISTFILE:h}"
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[OA' up-line-or-history
bindkey '^[OB' down-line-or-history

if command -v starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

nv() {
	if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
		tmux new-session -A -s main -n nvim nvim "$@"
	else
		nvim "$@"
	fi
}
