final: prev:
let
  fixConfigureFlags = old: {
    configureFlags = map (
      flag:
      if flag == "--with-pkgconfig=pkg-config" then
        "--with-pkgconfig=${final.stdenv.cc.targetPrefix}pkg-config"
      else
        flag
    ) old.configureFlags;
  };
in
{
  skawarePackages = prev.skawarePackages.overrideScope (
    _scopeFinal: scopePrev: {
      execline = scopePrev.execline.overrideAttrs (
        old:
        (fixConfigureFlags old)
        // {
          # https://github.com/NixOS/nixpkgs/issues/559916
          # https://github.com/NixOS/nixpkgs/pull/560025
          postInstall =
            builtins.replaceStrings
              [
                "$(pkg-config --cflags libskarnet)"
                "$(pkg-config --libs libskarnet)"
              ]
              [
                "$(${final.stdenv.cc.targetPrefix}pkg-config --cflags libskarnet)"
                "$(${final.stdenv.cc.targetPrefix}pkg-config --libs libskarnet)"
              ]
              old.postInstall;
        }
      );
      s6 = scopePrev.s6.overrideAttrs fixConfigureFlags;
    }
  );
}
