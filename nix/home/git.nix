{ ... }:

{
  programs.gpg.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      init.defaultBranch = "master";
      pull.rebase = true;
    };
  };
}
