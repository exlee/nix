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

  outputs = { self, nixpkgs, utils, naersk }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        naersk-lib = pkgs.callPackage naersk { };
        darwinInputs = with pkgs.darwin; [
          apple_sdk.frameworks.Security
          apple_sdk.frameworks.CoreFoundation
          apple_sdk.frameworks.CoreServices
          apple_sdk.frameworks.SystemConfiguration
          apple_sdk.frameworks.AppKit
          apple_sdk.frameworks.WebKit
          libiconv
        ];
      in
        {
            devShell = with pkgs; mkShell {
              packages = with pkgs; [
                cargo rustc
                rustfmt rustPackages.clippy
                rust-analyzer

                just watchexec
              ] ++ lib.optionals stdenv.isDarwin darwinInputs;
          };
        });
}
