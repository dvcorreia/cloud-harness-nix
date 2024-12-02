final: prev:
let
  harnessCliTools = final.callPackage ./harness-cli-tools.nix {
    inherit (final) python3 cloud-harness-src;
  };
in
{
  harness-deployment = harnessCliTools.harness-deployment;
  harness-generate = harnessCliTools.harness-generate;
  harness-application = harnessCliTools.harness-application;
}
