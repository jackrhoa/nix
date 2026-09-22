{ ... }: {
  homebrew = {
    enable = true;

    masApps = {
      "Bitwarden" = 1352778147;
      "Keynote" = 361285480;
      "iMovie" = 408981434;
      "Microsoft Excel" = 462058435;
      "Microsoft Outlook" = 985367838;
      "Microsoft Word" = 462054704;
      "Tailscale" = 1475387142;
      "Wipr" = 1662217862;
      "Xcode" = 497799835;
    };

    casks = [
      "firefox"
      "netnewswire"
      "maccy" # more reliable than nixpkg
    ];

    onActivation = {
      cleanup = "check";
    };

  };
}
