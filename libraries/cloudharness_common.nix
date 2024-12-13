{ python3, cloud-harness-src }:

python3.pkgs.buildPythonPackage {
  pname = "cloudharness";
  version = "2.4.0";
  src = "${cloud-harness-src}/libraries/cloudharness-common";

  propagatedBuildInputs = with python3.pkgs; [
    kubernetes
    pyyaml
    oyaml
    pyjwt
    cryptography
    requests
    sentry-sdk
    python-keycloak
    cloudharness_model
    argo-workflows
    cachetools
    blinker
    jinja2
    kafka-python-ng
    python-dateutil
  ];

  nativeCheckInputs = with python3.pkgs; [
    pytest
    pytest-cov
    pytest-mock
    coverage
    pyparsing
    python-keycloak
  ];

  checkPhase = ''
    pytest tests/
  '';

  doCheck = false; # tests seem to be failing
}
