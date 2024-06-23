{
  inputs = {
    utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          go-task watchexec swiProlog
        ];
      };
    }
  );
}
