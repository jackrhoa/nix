{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.unstable.scroll-reverser ];

  launchd.user.agents.scroll-reverser.serviceConfig = {
    ProgramArguments = [
      "${pkgs.unstable.scroll-reverser}/Applications/Scroll Reverser.app/Contents/MacOS/Scroll Reverser"
    ];
    RunAtLoad = true;
    ProcessType = "Interactive";
  };

}
