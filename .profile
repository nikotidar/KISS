# CFLAGS Options
export CHOST="x86_64-pc-linux-gnu"
export CFLAGS="-march=core-avx2 -mavx2 -O2 -pipe"
export CXXFLAGS="${CFLAGS}"
export MAKEFLAGS="-j3"

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
