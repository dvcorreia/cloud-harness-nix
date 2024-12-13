{ python3, fetchPypi }:

python3.pkgs.buildPythonPackage rec {
  pname = "argo-workflows";
  version = "6.6.2";

  src = fetchPypi {
    inherit version;
    pname = "argo_workflows";
    sha256 = "sha256-wiKFOdc2MCOnkTubNNcgz8aOsx13upR5QRuaW5seQ3o=";
  };

  doCheck = false;
}