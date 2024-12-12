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
          (import ./libraries)
          (import ./tools)
        ];

        pkgs = (import nixpkgs) { inherit system overlays; };

        pythonEnv = pkgs.python3.withPackages (
          ps: with ps; [
            cloudharness_model
            cloudharness_utils
            pip
            setuptools
            wheel
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

        devShell = pkgs.mkShell {
          packages = with pkgs; [
            pythonEnv

            harness-deployment
            harness-generate
            harness-application

            nodejs-slim
            yarn

            google-cloud-sdk

            docker
            kubectl
            kubernetes-helm
            skaffold

            postgresql # pg tools
          ];

          inputsFrom = with pkgs; [
            harness-deployment
            harness-generate
            harness-application
          ];

          # https://github.com/NixOS/nixpkgs/issues/314713
          UV_USE_IO_URING = 0;
        };
      }
    );
}
