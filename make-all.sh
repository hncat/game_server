args=$1

buildType="Debug"
clean=false

if [ ${args}v = "release"v ]; then
    buildType="Release"
elif [ ${args}v = "clean"v ]; then
    clean=true
fi

build(){
  cd build/
  if ${clean};then
      make clean
      rm -rf *
  else
      cmake -DCMAKE_BUILD_TYPE=${buildType} ..
      cmake --build .
  fi
}

cd src/libs/
build

# cd ../apps/
# build