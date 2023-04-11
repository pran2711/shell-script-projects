#!/bin/bash


Location="/home/pranav/Videos"

#check if directory exists or not

if [ ! -d $Location ]
then
    echo "directory does not exists"
fi

#create archive folder it not present

if [ ! -d $Location/archive ]
then
    mkdir $Location/archive || exit 1

fi

# compress and move files more than 20MB

for i in `find $Location -maxdepth 1 -type f -size +20M`
do
      gzip $i ||  exit 1
      mv $i.gz $Location/archive || exit 1
done