{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bazel
    kubectl
    k9s
    fluxcd
    kubernetes-helm
  ];
}
