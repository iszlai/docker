#!/bin/bash

echo $ZKLIST
sed -i "s/zklist/${ZKLIST}/g" config.cfg
/usr/bin/java -jar zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
