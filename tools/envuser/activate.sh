set -exu

export OPAM_ROOT="${WORKSPACE}/${OPAM_ROOT}"
export OPAM_ROOT_PATH="${WORKSPACE}/${OPAM_ROOT_PATH}"

export PATH="${OPAM_ROOT}/bin:${PATH}"
export OPAM="opam --root ${OPAM_ROOT_PATH}"

