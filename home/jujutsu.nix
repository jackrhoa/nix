{ config, ... }: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Jack Rhoa";
        email = "dev@jackrhoa.com";
      };
      ui = {
        editor = "nvim";
        pager = [ "less" "-FRX" ];
      };
      signing = {
        behavior = "own";
        backend = "ssh";
        key = "${config.home.homeDirectory}/.ssh/github_signing_key2";
        backends.ssh."allowed-signers" = "${config.home.homeDirectory}/.ssh/allowed_signers";
      };
      remotes.origin.auto-track-bookmarks = "*";
      aliases = {
        d = [ "diff" ];
      };
    };
  };
}
