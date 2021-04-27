#! /bin/bash

#
# CK install script for TVM
#
# See CK LICENSE.txt for licensing details.
# See CK COPYRIGHT.txt for copyright details.
#

echo "******************************************************"
cd ${INSTALL_DIR}
git clone -b "${PACKAGE_GIT_CHECKOUT}" ${PACKAGE_GIT_TVM} tvm --recursive

cd tvm

if [ "${PACKAGE_GIT_SHA}" != "" ]; then 
 git checkout ${PACKAGE_GIT_SHA}
fi

mkdir -p build

cp cmake/config.cmake build/.

echo 'set(USE_LLVM llvm-config)' >> build/config.cmake
echo 'set(USE_RELAY_DEBUG ON)' >> build/config.cmake

echo "******************************************************"
# Configure the package.
${CK_ENV_TOOL_CMAKE_BIN}/cmake .. \
  -DCMAKE_C_COMPILER="${CK_CC_PATH_FOR_CMAKE}" \
  -DCMAKE_C_FLAGS="${CK_CC_FLAGS_FOR_CMAKE} ${EXTRA_FLAGS}" \
  -DCMAKE_CXX_COMPILER="${CK_CXX_PATH_FOR_CMAKE}" \
  -DCMAKE_CXX_FLAGS="${CK_CXX_FLAGS_FOR_CMAKE} ${EXTRA_FLAGS}" \
  -DCMAKE_AR="${CK_AR_PATH_FOR_CMAKE}" \
  -DCMAKE_RANLIB="${CK_RANLIB_PATH_FOR_CMAKE}" \
  -DCMAKE_LINKER="${CK_LD_PATH_FOR_CMAKE}"

echo "******************************************************"
make -j${CK_HOST_CPU_NUMBER_OF_PROCESSORS}

echo "******************************************************"
echo "TVM was built and installed to ${PWD} ..."


