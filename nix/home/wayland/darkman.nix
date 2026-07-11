{ ... }:

{
  services.darkman = {
    enable = true;
    settings = {
      lat = 51.514244;
      lng = 7.468429;
    };
    lightModeScripts.default = ''
      export PATH="/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$PATH"
      dms ipc call theme light
      asdbctl set 40
    '';
    darkModeScripts.default = ''
      export PATH="/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$PATH"
      dms ipc call theme dark
      asdbctl set 20
    '';
  };
}
