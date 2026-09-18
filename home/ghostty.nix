{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "light:3024 Day,dark:3024 Night";
      macos-icon = "holographic";

      shell-integration-features = "ssh-env,ssh-terminfo";

      # new windows open in $HOME
      window-inherit-working-directory = false;
      working-directory = "home";
      tab-inherit-working-directory = false;

      # Alternate themes
      # theme = "theme = light:Belafonte Day,dark:Belafonte Night";
      # theme = "HaX0R Gr33n";
    };
  };
}
