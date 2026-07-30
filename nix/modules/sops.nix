{ ... }:
{
  # Without this, hashedPasswordFile is only seeded at user creation
  users.mutableUsers = false;

  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  sops.age.generateKey = true;
  sops.age.sshKeyPaths = [ ];
}
