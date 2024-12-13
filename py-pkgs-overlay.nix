final: prev: {
  python3 = prev.python3.override {
    packageOverrides = python-final: python-prev: {
      # dependencies that are not on nixpkgs
      argo-workflows = final.callPackage ./pkgs/python/argo-workflows.nix {
        inherit (final) python3;
      };

      django-admin-extra-buttons = final.callPackage ./pkgs/python/django-admin-extra-buttons.nix {
        inherit (final) python3;
      };

      # fastapi-code-generator = final.callPackage ./pkgs/python/fastapi-code-generator.nix {
      #   inherit (final) python3;
      # };

      # cloud harness libs
      cloudharness_model = final.callPackage ./libraries/cloudharness_model.nix {
        inherit (final) python3 cloud-harness-src;
      };

      cloudharness_utils = final.callPackage ./libraries/cloudharness_utils.nix {
        inherit (final) python3 cloud-harness-src;
      };

      cloudharness = final.callPackage ./libraries/cloudharness_common.nix {
        inherit (final) python3 cloud-harness-src;
      };

      cloudharness-cli = final.callPackage ./libraries/cloudharness-cli.nix {
        inherit (final) python3 cloud-harness-src;
      };

      # cloud harness infrastructure libs
      cloudharness-django = final.callPackage ./infrastructure/cloudharness-django.nix {
        inherit (final) python3 cloud-harness-src;
      };
    };
  };
}
