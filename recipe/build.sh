#!/bin/bash
export LDFLAGS="${LDFLAGS} -lblas"

if [[ $HOST == *"apple"* ]]; then
  export CFLAGS="${CFLAGS} -fopenmp"
  make -j${CPU_COUNT} PREFIX=${PREFIX}
else
  make -j${CPU_COUNT} PREFIX=${PREFIX} STATIC=0
fi
make -j${CPU_COUNT} install
make -j${CPU_COUNT} test
make -j${CPU_COUNT} test-all
