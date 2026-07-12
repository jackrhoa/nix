{ config, ... }: {
  programs.git = {
    enable = true;
    # Git Large File Storage
    lfs.enable = true;
    signing = {
      key = "${config.home.homeDirectory}/.ssh/git_key";
      format = "ssh";
      signByDefault = true;
    };
    ignores = [
      ".DS_Store"
    ];
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
        a = "add";
        d = "diff";
      };
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
      push.autosetupremote = true;
      pull.rebase = true;
      pull.autoStash = true;
      fetch.prune = true;
      merge.conflictstyle = "zdiff3";
      diff.algorithm = "histogram";
      commit.verbose = true;
    };    
  };
}
