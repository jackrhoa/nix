{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.sioyek

    (pkgs.writeShellScriptBin "sioyek-inverse-search" ''
      exec ${config.programs.neovim.finalPackage}/bin/nvim \
        --server /tmp/nvim-preview.sock \
        --remote-expr "v:lua.PreviewSynctex('$1',$2)"
    '')
  ];
}
