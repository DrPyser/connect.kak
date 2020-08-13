# Wofi
# https://hg.sr.ht/~scoopta/wofi

# Dependencies:
# – fd (https://github.com/sharkdp/fd)

provide-module connect-wofi %{
  require-module connect

  define-command wofi-files -params .. -file-completion -docstring 'Open files with Wofi' %{
    $ %(:edit $(fd --type file . "$@" | wofi --dmenu --prompt 'Open files')) -- %arg{@}
  }

  define-command wofi-buffers -params ..1 -buffer-completion -docstring 'Open buffers with Wofi' %{
    $ %(:buffer $(:ls | grep -F "$1" | wofi --dmenu --prompt 'Open buffers')) -- %arg{@}
  }

  alias global wofi wofi-files
}
