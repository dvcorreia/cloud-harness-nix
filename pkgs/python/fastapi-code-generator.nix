{ python3, fetchFromGitHub, poetry }:

python3.pkgs.buildPythonPackage rec {
  pname = "fastapi-code-generator";
  version = "0.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "koxudaxi";
    repo = "fastapi-code-generator";
    rev = "${version}";
    hash = "sha256-NUA/xJS35DSmrvTYwdX3rEjWpqbCsK4Tg96DcsU6PAY=";
  };

  build-system = [ python3.pkgs.poetry-core ];

  doCheck = false;
}