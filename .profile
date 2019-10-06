# misc
export ENV=~/.ashrc
export PS1='» '
export LESSHISTFILE=-
export PATH=$PATH:~/bin:~/.local/bin
export VISUAL=vim
export EDITOR="$VISUAL"

# keymap
loadkmap < $HOME/.us.bmap

# gpg
export GPG_TTY=$(tty)
