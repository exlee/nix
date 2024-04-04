{
  inputs = {
    utils = {
      url = "github:numtide/flake-utils";
    };
    naersk = {
      url = "github:nix-community/naersk/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, utils, naersk }: utils.lib.eachDefaultSystem (system:
    let
      rust_flake = (import ./nix/rust.nix).outputs { inherit self; inherit nixpkgs; inherit utils; inherit naersk; };
      rust = rust_flake;

      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      devShell = pkgs.mkShell {
        inputsFrom = [
          rust.devShell.${system}
        ];
        packages = with pkgs; [

          souffle just watchexec
        ];
      };
    }
  );
}
