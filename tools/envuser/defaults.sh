set -ex
set +u

if test -z "${OPAM_ROOT}"; then
    export OPAM_ROOT="ROOT/OPAM";
fi

if test -z "${OPAM_ROOT_PATH}"; then
    export OPAM_ROOT_PATH="ROOT/OPAM_ROOT";
fi

if test -z "${DEPENDENCIES}"; then
    export DEPENDENCIES="";
fi

if test -z "${OCAML_VERSION}"; then
    export OCAML_VERSION="3.12.1";
fi

if test -z "${RESET_OPAM}"; then
    export RESET_OPAM="false";
fi

set -u
