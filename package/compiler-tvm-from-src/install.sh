#! /bin/bash

#
# CK install script for TVM
#
# See CK LICENSE.txt for licensing details.
# See CK COPYRIGHT.txt for copyright details.
#

echo "******************************************************"
cd ${INSTALL_DIR}

if [ ! -d "tvm" ]; then
  git clone -b "${PACKAGE_GIT_CHECKOUT}" ${PACKAGE_GIT_URL} tvm --recursive
  if [ "${?}" != "0" ]; then exit 1; fi
fi

cd tvm

if [ "${PACKAGE_GIT_SHA}" != "" ]; then 
  git checkout ${PACKAGE_GIT_SHA}
  if [ "${?}" != "0" ]; then exit 1; fi
fi

mkdir -p build

cp cmake/config.cmake build/.

echo 'set(USE_LLVM llvm-config)' >> build/config.cmake


if [ "x${USE_OPENMP}" != "x" ]; then
  echo "==> CK: USE_OPENMP=${USE_OPENMP}"
  echo 'set(USE_OPENMP ${USE_OPENMP})' >> build/config.cmake
fi

if [ "x${USE_RELAY_DEBUG}" == "xON" ]; then
  echo "==> CK: USE_RELAY_DEBUG=ON"
  echo 'set(USE_RELAY_DEBUG ON)' >> build/config.cmake
fi

if [ "x${USE_GRAPH_RUNTIME_DEBUG}" == "xON" ]; then
  echo "==> CK: USE_GRAPH_RUNTIME_DEBUG=ON"
  echo 'set(USE_GRAPH_RUNTIME_DEBUG ON)' >> build/config.cmake
fi

if [ "x${USE_GRAPH_EXECUTOR_DEBUG}" == "xON" ]; then
  echo "==> CK: USE_GRAPH_EXECUTOR_DEBUG=ON"
  echo 'set(USE_GRAPH_EXECUTOR_DEBUG ON)' >> build/config.cmake
fi

if [ "x${USE_VULKAN}" == "xON" ]; then
  echo "==> CK: USE_VULKAN=ON"
  echo 'set(USE_VULKAN ON)' >> build/config.cmake
fi

echo "******************************************************"
# Configure the package.
cd build
${CK_ENV_TOOL_CMAKE_BIN}/cmake .. \
  -DCMAKE_C_COMPILER="${CK_CC_PATH_FOR_CMAKE}" \
  -DCMAKE_C_FLAGS="${CK_CC_FLAGS_FOR_CMAKE} ${EXTRA_FLAGS}" \
  -DCMAKE_CXX_COMPILER="${CK_CXX_PATH_FOR_CMAKE}" \
  -DCMAKE_CXX_FLAGS="${CK_CXX_FLAGS_FOR_CMAKE} ${EXTRA_FLAGS}" \
  -DCMAKE_AR="${CK_AR_PATH_FOR_CMAKE}" \
  -DCMAKE_RANLIB="${CK_RANLIB_PATH_FOR_CMAKE}" \
  -DCMAKE_LINKER="${CK_LD_PATH_FOR_CMAKE}"
if [ "${?}" != "0" ]; then exit 1; fi

echo "******************************************************"
make -j${CK_HOST_CPU_NUMBER_OF_PROCESSORS}
if [ "${?}" != "0" ]; then exit 1; fi

echo "******************************************************"
echo "TVM was built and installed to ${PWD} ..."
