#!/bin/bash
env
function or_die () {
    "$@"
    local status=$?
    if [[ $status != 0 ]] ; then
        echo ERROR $status command: $@
        exit $status
    fi
}

or_die mkdir travis-build
cd travis-build
if [[ "$DO_BUILD" == "yes" ]] ; then
    cmake -DENABLE_MPI=Off -DCMAKE_CXX_COMPILER=`which $COMPILER` -DCMAKE_Fortran_COMPILER=gfortran ../
    or_die make -j 3 VERBOSE=1
fi

exit 0