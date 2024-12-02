{ python3, cloud-harness-src }:

python3.pkgs.buildPythonPackage {
  pname = "cloudharness_utils";
  version = "2.4.0";
  src = "${cloud-harness-src}/libraries/cloudharness-utils";

  propagatedBuildInputs = with python3.pkgs; [
    ruamel-yaml
    cloudharness_model
    docker
  ];

  doCheck = false;
}
