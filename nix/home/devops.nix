{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bazel
    kubectl
    fluxcd
    kubernetes-helm
  ];
}
