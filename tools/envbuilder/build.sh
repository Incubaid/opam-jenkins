set -exu

MY_DIR=$(dirname $(readlink -f $0))

. "${MY_DIR}/defaults.sh"
. "${MY_DIR}/activate.sh"

OCAML_TARBALL_NAME=$(basename "${OCAML_URL}");
OCAML_DIR=$(basename "${OCAML_URL}" ".tar.bz2")
OPAM_TARBALL_NAME="opam.tar.gz"

mkdir -p "${ROOT}/OCAML"
mkdir -p "${ROOT}/OPAM"
OCAML_PREFIX=$(readlink -f "${ROOT}/OCAML")
OPAM_PREFIX=$(readlink -f "${ROOT}/OPAM")

if test ! -d "${OCAML_DIR}"; then
  wget "${OCAML_URL}" -O "${OCAML_TARBALL_NAME}"
  tar -jxf "${OCAML_TARBALL_NAME}"
fi
cd "${OCAML_DIR}"

./configure --prefix "${OCAML_PREFIX}"
make 'world.opt'
make 'install'

# Activate the OCaml
export PATH="${OCAML_PREFIX}/bin:${PATH}}"

cd "${WORKSPACE}"
wget "${OPAM_URL}" -O "${OPAM_TARBALL_NAME}"

rm -Rf ${OPAM_DIR_PATTERN}*

tar -xzf "${OPAM_TARBALL_NAME}"
cd ${OPAM_DIR_PATTERN}*
./configure --prefix "${OPAM_PREFIX}"
make
make 'install'

cd "${WORKSPACE}"
cp -R "tools/envuser/" "${OPAM_PREFIX}"
