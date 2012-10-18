set -exu

case ${OPAM_ROOT} in
  /*)
    echo "OPAM_ROOT is absolute" ;;
  *)
    echo "OPAM_ROOT is relative";
    export OPAM_ROOT="${WORKSPACE}/${OPAM_ROOT}" ;;
esac

case $OPAM_ROOT_PATH in
  /*)
    echo "OPAM_ROOT_PATH is absolute" ;;
  *)
    echo "OPAM_ROOT_PATH is relative";
    export OPAM_ROOT_PATH="${WORKSPACE}/${OPAM_ROOT_PATH}" ;;
esac

case `which opam` in
  ${OPAM_ROOT}/bin/opam)
    echo "PATH already patched" ;;
  *)
    export PATH="${OPAM_ROOT}/bin:${PATH}" ;;
esac

export OPAM="opam --root ${OPAM_ROOT_PATH}"
