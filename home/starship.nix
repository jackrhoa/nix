{
  programs.starship = {
    enable = true;
    settings = {
      command_timeout = 1000;

      gcloud.disabled = true;
      python.disabled = true;
      nodejs.disabled = true;
      package.disabled = true;

      git_branch.disabled = true;
      git_commit.disabled = true;
      git_state.disabled = true;
      git_status.disabled = true;

      custom.jj = {
        when = "jj root --ignore-working-copy";
        command = ''
          jj log --revisions @ --no-graph --color never --template '
            separate(" ",
              coalesce(bookmarks.join(" "), change_id.shortest()),
              if(empty, "(empty)"),
              coalesce(description.first_line(), "(no description set)"),
            )
          '
        '';
        symbol = " ";
        style = "bold purple";
        format = "on [$symbol$output]($style) ";
      };

      custom.git = {
        when = "! jj root --ignore-working-copy && git rev-parse --is-inside-work-tree";
        command = ''
          echo "$(git branch --show-current | grep . || git rev-parse --short HEAD)$(git status --porcelain | grep -q . && echo ' *')"
        '';
        symbol = " ";
        style = "bold purple";
        format = "on [$symbol$output]($style) ";
      };
    };
  };
}
