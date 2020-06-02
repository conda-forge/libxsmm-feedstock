#!/bin/bash
export LDFLAGS="${LDFLAGS} -lblas"

if [[ $HOST == *"apple"* ]]; then
  make -j${CPU_COUNT} PREFIX=${PREFIX}
else
  make -j${CPU_COUNT} PREFIX=${PREFIX} STATIC=0
fi
make -j${CPU_COUNT} install
make -j${CPU_COUNT} test
make -j${CPU_COUNT} test-all
