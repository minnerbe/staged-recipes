#!/bin/bash

INSTALL_DIR="${PREFIX}/bin"
MVN_REPOSITORY="${PREFIX}/lib/stim"

mkdir -p ${INSTALL_DIR}
mkdir -p ${MVN_REPOSITORY}

./install.sh -i ${INSTALL_DIR} -r ${MVN_REPOSITORY}

# conda uses a dummy-prefix to build, but the path is hard-coded in the commands
# replace by a variable that points to the correct location on the host
find $PREFIX/bin -name st-* | xargs sed -i "s,${PREFIX},\$CONDA_PREFIX,g"
