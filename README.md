## Requirements for MAC OS only##
 Download and install Homebrew to use mitie-resources



## Setting up MITIE for TIKA ##

```
# create any source folder, cd into it and paste the following commands
git clone https://github.com/manalishah/mitie-resources.git
cd mitie-resources
# absolute path to mitie-resources folder 
export NER_RES=$PWD
export TIKA_APP={absolute-path-to-tika-app-1.13-SNAPSHOT.jar}
chmod a+x install.sh
./install.sh
```


## Enabling MITIE with TIKA-APP ##

**For Mac OS**
```
 java -Djava.library.path=$NER_RES/MITIE/mitielib -Dner.mitie.model=$NER_RES/MITIE/MITIE-models/english/ner_model.dat -Dner.impl.class=org.apache.tika.parser.ner.mitie.MITIENERecogniser -classpath $NER_RES/MITIE/mitielib/javamitie.jar:$TIKA_APP org.apache.tika.cli.TikaCLI --config=$NER_RES/tika-config.xml -m $NER_RES/sample.txt

```

**For Window/Linux OS**
```
 java -Dner.mitie.model=$NER_RES/MITIE/MITIE-models/english/ner_model.dat -Dner.impl.class=org.apache.tika.parser.ner.mitie.MITIENERecogniser -classpath $NER_RES/MITIE/mitielib/javamitie.jar:$TIKA_APP org.apache.tika.cli.TikaCLI --config=$NER_RES/tika-config.xml -m $NER_RES/sample.txt

```
This should output the following metadata keys:

```
Content-Length: 63
Content-Type: text/plain
NER_LOCATION: Los Angeles
NER_LOCATION: California
X-Parsed-By: org.apache.tika.parser.CompositeParser
X-Parsed-By: org.apache.tika.parser.ner.NamedEntityParser
resourceName: sample.txt
```


Questions, comments?
===================
Send them to [Manali Shah](manalids@usc.edu)

Contributors
============
* Manali Shah, USC

License
=======
[Apache License, version 2](http://www.apache.org/licenses/LICENSE-2.0)