set -ex
set +u

if test -z "${ROOT}"; then
    export ROOT="ROOT";
fi

if test -z "${OCAML_URL}"; then
    export OCAML_URL="http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.1.tar.bz2";
fi

if test -z "${OPAM_URL}"; then
    export OPAM_URL="https://github.com/OCamlPro/opam/tarball/master"
fi

if test -z "${OPAM_DIR_PATTERN}"; then
    export OPAM_DIR_PATTERN="OCamlPro-opam-"
fi

set -u
