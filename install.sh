pwd=$(pwd)
git clone https://github.com/mit-nlp/MITIE.git
cd MITIE

make MITIE-models
#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#install cmake
brew install cmake
#install swig
brew install swig

cd mitielib
make

cd java
mkdir build
cd build
cmake ..
cmake --build . --config Release --target install
cd ../
cp cmake_swig_jni../javamitie.jar ../
cp cmake_swig_jni../libjavamitie.jnilib ../
cp cmake_swig_jni../javamitie.jar $pwd
cp cmake_swig_jni../libjavamitie.jnilib $pwd



