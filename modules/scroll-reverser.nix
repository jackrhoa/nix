{ pkgs, ... }:
let
  scroll-reverser = pkgs.unstable.scroll-reverser.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      find "$out" -name '._*' -delete
    '';
  });
in {

  environment.systemPackages = [ scroll-reverser ];

  launchd.user.agents.scroll-reverser.serviceConfig = {
    ProgramArguments = [
      "${scroll-reverser}/Applications/Scroll Reverser.app/Contents/MacOS/Scroll Reverser"
    ];
    RunAtLoad = true;
    ProcessType = "Interactive";
  };

}
