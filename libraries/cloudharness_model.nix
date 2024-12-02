{ python3, cloud-harness-src }:

python3.pkgs.buildPythonPackage {
  pname = "cloudharness_model";
  version = "2.4.0";
  src = "${cloud-harness-src}/libraries/models";

  propagatedBuildInputs = with python3.pkgs; [
    jinja2
    oyaml
    psutil
    pyhumps
    python-dateutil
    pyyaml
    six
  ];

  nativeCheckInputs = with python3.pkgs; [
    pytest
    pytest-cov
    pytest-randomly
    flask-testing
  ];

  checkPhase = ''
    pytest test/
  '';

  doCheck = true;
}
