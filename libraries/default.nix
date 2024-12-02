final: prev: {
  python3 = prev.python3.override {
    packageOverrides = python-final: python-prev: {
      cloudharness_model = final.callPackage ./cloudharness_model.nix {
        inherit (final) python3 cloud-harness-src;
      };

      cloudharness_utils = final.callPackage ./cloudharness_utils.nix {
        inherit (final) python3 cloud-harness-src;
      };
    };
  };
}
