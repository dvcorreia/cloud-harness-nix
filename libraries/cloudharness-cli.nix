{ python3, cloud-harness-src }:

# let
#   urllib3 = python3.pkgs.urllib3.overrideAttrs (
#     finalAttrs: previousAttrs: {
#       version = "2.0.7"; # >= 1.25.3, < 2.1.0
#     }
#   );
# in
python3.pkgs.buildPythonPackage {
  pname = "cloudharness-cli";
  version = "2.4.0";
  src = "${cloud-harness-src}/libraries/client/cloudharness_cli";

  propagatedBuildInputs = with python3.pkgs; [
    python-dateutil
    setuptools
    urllib3
    pydantic
    typing-extensions
  ];

  nativeCheckInputs = with python3.pkgs; [
    pytest
    pytest-cov
    pytest-randomly
    mypy
    types-python-dateutil
  ];

  checkPhase = ''
    pytest test/
  '';

  doCheck = false; # some issue with importing cloudharness_cli
}
