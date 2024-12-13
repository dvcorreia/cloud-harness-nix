{ python3, cloud-harness-src }:

python3.pkgs.buildPythonPackage {
  pname = "cloudharness-django";
  version = "0.1";
  src = "${cloud-harness-src}/infrastructure/common-images/cloudharness-django/libraries/cloudharness-django";

  propagatedBuildInputs = with python3.pkgs; [
    # fastapi requirements
    fastapi
    # fastapi-code-generator # need to fix derivation
    uvicorn

    # cloudharness-django requirements
    django
    django-admin-extra-buttons
    psycopg2-binary
    pillow
    python-keycloak
  ];

  doCheck = false;
}