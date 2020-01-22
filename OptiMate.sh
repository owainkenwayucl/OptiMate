#!/bin/bash -l

set -e

optimet_repo=${optimet_repo:-https://github.com/OPTIMET/OPTIMET}
optimet_ver=${optimet_ver:-v1.0.1}
trilinos_repo=${trilinos_repo:-https://github.com/trilinos/Trilinos}
trilinos_ver=${trilinos_ver:-trilinos-release-12-10-1}

location=$(dirname $(readlink -f ${0}))
time_stamp=$(date -u +%s)
install_prefix=${install_prefix:-$(pwd)/Optimet-${time_stamp}}

echo "Optimate installation location: ${location}"

source ${location}/deps.sh

echo "Building + installing in ${install_prefix}"

mkdir -p ${install_prefix}
cd ${install_prefix}

echo "Fetching and installing Trilinos (for Belos)"

git clone ${trilinos_repo}
cd $(basename ${trilinos_repo})
git checkout ${trilinos_ver}

mkdir build
cd build
cmake .. -DTPL_ENABLE_MPI=ON -DTrilinos_ENABLE_Belos=ON -DCMAKE_INSTALL_PREFIX=${install_prefix}/belos_install
make -j 12
make install
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:${install_prefix}/belos_install


cd ${install_prefix}

echo "Fetching and building Optimet"
git clone ${optimet_repo}
cd $(basename ${optimet_repo})
git checkout ${optimet_ver}

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -Ddompi=ON -Ddotesting=OFF -Ddobenchmarks=OFF -DCMAKE_EXE_LINKER_FLAGS=-lgfortran
make -j 12

echo "Installing in ${install_prefix}/bin (/lib for library)"

mkdir ${install_prefix}/bin
cp Optimet3D  ${install_prefix}/bin
mkdir ${install_prefix}/lib
cp liboptilib.a ${install_prefix}/lib
