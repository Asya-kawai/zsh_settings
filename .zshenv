limit coredumpsize 0
typeset -U path
# (N-/) ignore the path if it does not exists and do not add it to $path.
path=(/usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/) $path)
