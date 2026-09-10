final: prev: {
  gamescope-session = prev.gamescope-session.overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      substituteInPlace gamescope-session \
        --replace-fail "-w 1280 -h 800" "-w 2560 -h 1440"
    '';
  });
}
