{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    historyLimit = 10000;
    keyMode = "vi";
    extraConfig = ''
      setw -g pane-base-index 1

      set -g set-clipboard on

      # send copied content to mac keyboard
      bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "pbcopy"

      # new panes in same dir
      bind '"' split-window -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"
    '';

  };
}
