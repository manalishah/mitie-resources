#!/usr/bin/env
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
echo "start"
maindir=$(pwd)
git clone https://github.com/mit-nlp/MITIE.git
cd MITIE
make MITIE-models

if [ "$(uname)" == "Darwin" ]; then
	brew install cmake
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
	cp cmake_swig_jni../javamitie.jar $maindir
	cp cmake_swig_jni../libjavamitie.jnilib $maindir
else
	wget "http://central.maven.org/maven2/edu/mit/ll/mitie/0.6/mitie-0.6.jar" -O mitielib/javamitie.jar
fi
echo "complete"
