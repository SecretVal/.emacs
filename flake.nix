{
  description = "Emacs configuration with emacs-overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = {
    nixpkgs,
    emacs-overlay,
    ...
    }: let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [emacs-overlay.overlays.default];
      };

      myEmacs = pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs-unstable-pgtk;
        config = ./config.el;
        defaultInitFile = true;
        alwaysEnsure = true;

        extraEmacsPackages = epkgs: with epkgs; [
          treesit-grammars.with-all-grammars
          base16-theme
        ];
      };
    in {
      packages.${system}.default = myEmacs;

      apps.${system}.default = {
        type = "app";
        program = "${myEmacs}/bin/emacs";
      };
    };
}
