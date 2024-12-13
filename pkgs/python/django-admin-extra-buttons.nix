{ python3, fetchPypi }:

python3.pkgs.buildPythonPackage rec {
  pname = "django-admin-extra-buttons";
  version = "1.6.0";
  format = "pyproject";

  src = fetchPypi {
    inherit version;
    pname = "django_admin_extra_buttons";
    sha256 = "sha256-vyYKplT4LhJXGKozf4rNrvRpWdyYHPRs1c3i21d8C9U=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    setuptools
  ];

  doCheck = false;
}