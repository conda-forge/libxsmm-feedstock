#!/bin/bash
set -ex

mv BUILD BUILD.bak

cmake -B build -S . \
  ${CMAKE_ARGS} \
  -DBUILD_SHARED_LIBS="ON" \
  -DBUILD_TESTING="OFF" \
  -DLIBXSMM_FORTRAN="ON" \
  -GNinja
cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
