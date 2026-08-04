# nix-darwin bootstrap

## 1. Install Nix

```sh
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh
```

## 2. First switch

```sh
sudo nix --extra-experimental-features 'nix-command flakes' \
  run nix-darwin/nix-darwin-26.05#darwin-rebuild -- \
  switch --flake ~/Repos/dotfiles#mbp-personal
```

If it fails with "Unexpected files in /etc", back them up and re-run:

```sh
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
sudo mv /etc/bashrc /etc/bashrc.before-nix-darwin
sudo mv /etc/zprofile /etc/zprofile.before-nix-darwin
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
```

## 3. Subsequent rebuilds

```sh
darwin-rebuild switch --flake ~/Repos/dotfiles#mbp-personal
```