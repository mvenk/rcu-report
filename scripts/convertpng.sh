#!/bin/bash
#maintain a png version of each file for email
elements=`ls -1 ../images/*.eps | sed 's/.eps//g'`
for k in $elements
do
	convert -geometry 2000 -density 2000 -background white $k.eps $k.png
done
