{ lib, pkgs, ... }: {
  home.extraActivationPath = [ pkgs.curl ] ++ lib.optional pkgs.stdenv.isDarwin pkgs.perl;

  home.activation.verifyClaudeInstalled = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -x "$HOME/.local/bin/claude" ]; then
      run bash -c "curl -fsSL https://claude.ai/install.sh | bash" \
        || echo "claude code install failed, skipping"
    fi
  '';
}
