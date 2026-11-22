{ lib, pkgs, ... }:
let
  statusline = pkgs.writeShellApplication {
    name = "claude-statusline";
    runtimeInputs = [ pkgs.jq pkgs.git ];
    bashOptions = [ ];
    excludeShellChecks = [ "SC2154" ];
    text = builtins.readFile ./claude/statusline.sh;
  };
in
{
  home.extraActivationPath = [ pkgs.curl ] ++ lib.optional pkgs.stdenv.isDarwin pkgs.perl;

  home.file.".claude/statusline.sh".source = "${statusline}/bin/claude-statusline";

  home.activation.verifyClaudeInstalled = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -x "$HOME/.local/bin/claude" ]; then
      run bash -c "curl -fsSL https://claude.ai/install.sh | bash" \
        || echo "claude code install failed, skipping"
    fi
  '';
}
