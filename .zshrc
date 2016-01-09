# $PATH
export PATH=/usr/local/Cellar:$PATH
export PATH=/Applications/MAMP/bin/php/php5.6.7/bin:$PATH

# 環境変数
export LANG=ja_JP.UTF-8

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 色を使用出来るようにする
autoload -Uz colors; colors

# もしかして機能
setopt correct

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示される度にプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプト指定
PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%
%(?.%{$fg[green]%}.%{$fg[cyan]%})%(?!(*'-') < !(*;-;%)? < )%{${reset_color}%}"

# プロンプト指定（コマンドの続き）
#PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[magenta]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[magenta]%}かな？ %{$fg[red]%}[そう！(y), ちがう！(n),a,e]:${reset_color} "

# ディレクトリ名だけでcdする
setopt AUTO_CD
cdpath=(.. ~ ~/src)
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups


# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# vim:set ft=zsh :
