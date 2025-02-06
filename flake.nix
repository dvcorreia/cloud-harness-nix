{
  description = "MetaCell Cloud Harness packages and tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    cloud-harness-src = {
      url = "github:MetaCell/cloud-harness";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      cloud-harness-src,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [
          (final: prev: { inherit cloud-harness-src; })
          (import ./py-pkgs-overlay.nix)
          (import ./tools)
        ];

        pkgs = (import nixpkgs) { inherit system overlays; };

        pythonEnv = pkgs.python3.withPackages (
          ps: with ps; [
            pip
            setuptools
            wheel

            cloudharness
            cloudharness_model
            cloudharness_utils
            cloudharness-cli

            cloudharness-django
          ]
        );
      in
      {
        packages = {
          inherit (pkgs) harness-deployment harness-generate harness-application;
          pythonPackages = {
            inherit (pkgs.python3.pkgs) cloudharness_model cloudharness_utils;
          };
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            pythonEnv

            harness-deployment
            harness-generate
            harness-application
          ];
        };

        devShells.django-app = pkgs.mkShell {
          packages = with pkgs; [
            # cli tools
            harness-deployment
            harness-generate
            harness-application

            # backend dependencies
            pythonEnv

            # frontend dependencies
            nodejs-slim
            yarn
          ];

          # https://github.com/NixOS/nixpkgs/issues/314713
          UV_USE_IO_URING = 0;
        };
      }
    );
}
