## Setting up MITIE for TIKA ##

```
# create any source folder, cd into it and paste the following commands
git clone https://github.com/manalishah/mitie-resources.git
cd mitie-resources
export NER_RES=$PWD
chmod a+x install.sh
./install.sh
```


## Using MITIE with TIKA-APP ##

```
 java -Djava.library.path=$NER_RES/MITIE/mitielib -Dner.mitie.model=$NER_RES/MITIE/MITIE-models/english/ner_model.dat -Dner.impl.class=org.apache.tika.parser.ner.mitie.MITIENERecogniser -classpath $NER_RES/MITIE/mitielib/javamitie.jar:{path to tika-app}/tika-app-1.13-SNAPSHOT.jar org.apache.tika.cli.TikaCLI --config=$NER_RES/tika-config.xml -m $NER_RES/sample.txt
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
