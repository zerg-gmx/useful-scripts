# mkc
mkc is for ```mkdir -p some/path && cd some/path```.
to use alias for mkc, add to .bashrc:

```
alias mkc='function _mkc() { mkdir -p "$1" && cd "$1"; }; _mkc'
```
