{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.unstable.maccy ];

  launchd.user.agents.maccy.serviceConfig = {
    ProgramArguments = [
      "${pkgs.unstable.maccy}/Applications/Maccy.app/Contents/MacOS/Maccy"
    ];
    RunAtLoad = true;
    ProcessType = "Interactive";
  };


}
