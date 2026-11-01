{ lib, ... }: {
  options.my.signingKeyName = lib.mkOption {
    type = lib.types.str;
    default = "github_signing_key";
  };
}
