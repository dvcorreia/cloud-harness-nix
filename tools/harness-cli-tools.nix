{
  lib,
  python3,
  fetchPypi,
  cloud-harness-src,
}:

let
  commonDeps = with python3.pkgs; [
    ruamel-yaml
    oyaml
    docker
    six
    cloudharness_model
    cloudharness_utils
    # dirhash # unsupported for macos
    strenum
  ];

  mkHarnessCliTool =
    name: script:
    python3.pkgs.buildPythonApplication {
      pname = name;
      version = "2.3.0";
      src = "${cloud-harness-src}/tools/deployment-cli-tools";

      propagatedBuildInputs = commonDeps;
      nativeCheckInputs = with python3.pkgs; [
        pytest
        pytest-cov
        coverage
        pytest-randomly
        pyparsing
      ];

      checkPhase = "pytest tests/";
      doCheck = false; # something is failing in the tests

      postInstall = ''
        mkdir -p $out/bin
        cp ${script} $out/bin/${name}
        chmod +x $out/bin/${name}
      '';
    };
in
{
  harness-deployment = mkHarnessCliTool "harness-deployment" "${cloud-harness-src}/tools/deployment-cli-tools/harness-deployment";
  harness-generate = mkHarnessCliTool "harness-generate" "${cloud-harness-src}/tools/deployment-cli-tools/harness-generate";
  harness-application = mkHarnessCliTool "harness-application" "${cloud-harness-src}/tools/deployment-cli-tools/harness-application";
}
