# ===========================================
# Fastfetch na inicialização
# ===========================================
if command -v fastfetch &> /dev/null; then
    fastfetch
fi




# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===========================================
# Configuração ZSH - samns
# ===========================================



# Caminho do Oh-My-Zsh
if [ -d "/usr/share/oh-my-zsh" ]; then
    export ZSH="/usr/share/oh-my-zsh"
else
    export ZSH="$HOME/.oh-my-zsh"
fi

# Tema Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Configuração do zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Configurações de histórico
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    zsh-completions
    zsh-256color
    colored-man-pages
    command-not-found
    zsh-autocomplete
)

# Carregar Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# ===========================================
# Aliases
# ===========================================
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Aliases úteis
alias cls='clear'
alias h='history'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# ===========================================
# Funções úteis
# ===========================================

# Criar diretório e entrar nele
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extrair arquivos compactados
extract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' não pode ser extraído" ;;
        esac
    else
        echo "'$1' não é um arquivo válido"
    fi
}


# ===========================================
# Configurações pessoais
# ===========================================
# Adicione suas configurações personalizadas abaixo

# Carregar arquivo de configurações pessoais (se existir)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
