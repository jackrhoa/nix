{ config, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "Jack Rhoa";
        email = "dev@jackrhoa.com";
      };
      core = {
        editor = "nvim";
        autocrlf = "input";
        pager = "less";
      };
      init.defaultBranch = "main";
      alias = {
        st = "status";
        co = "checkout";
        ci = "commit";
      };
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
      push.autosetupremote = true;
    };
      signing = {
        key = "${config.home.homeDirectory}/.ssh/git_key";
        format = "ssh";
        signByDefault = true;
      };
  };
}
