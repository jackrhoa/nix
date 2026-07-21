{pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "compress-tar-zstd" ''
      export PATH="/etc/profiles/per-user/$USER/bin/:/usr/bin/"

      # ensures decompress saves at relative path (maybe)
      src="$1"
      dir="$(dirname "$src")"
      name="$(basename "$src")"

      tar -cf - -C "$dir" "$name" | zstd -9 -o "$src".tar.zst
    '')
    (pkgs.writeShellScriptBin "decompress-zstd-tar" ''
      export PATH="/etc/profiles/per-user/$USER/bin/:/usr/bin/"

      # ensures uncompressed version saves at relative path
      src="$1"
      dir="$(dirname "$src")"

      zstd -dc "$src" | tar -xkf - -C "$dir"
    '')
  ];
}
