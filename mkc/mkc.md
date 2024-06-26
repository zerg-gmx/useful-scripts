# mkc
```mkc``` is for ```mkdir -p some/path && cd some/path```.
To use alias for mkc, add to .bashrc:

```
alias mkc='function _mkc() { mkdir -p "$1" && cd "$1"; }; _mkc'
```
And it's good to name it for one's own preference.
