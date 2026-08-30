{
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
      remotes.origin.auto-track-bookmarks = "*";
      aliases = {
        d = [ "diff" ];
      };
    };
  };
}
