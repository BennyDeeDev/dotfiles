{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    fuse
    gcc
  ];
  environment.variables.EDITOR = "vim";
}
