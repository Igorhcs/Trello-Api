#!/bin/bash

###########
# Script to Remove HC Cards on Trello
# @script:      autocard_remove 
# @author:      Igor Henrique  
# @mail:        igorhcs@br.ibm.com
# @version:     1.1
###########
for l in `cat list`; do


curl --request GET \
   --url "https://api.trello.com/1/lists/$l/cards?key=d3610897c8e5ab28199de6cef5ebcfea&token=8244aa364fe6658c0c91289385d42367726d1640240d583e1db2fc3a10757a52" > remove

grep  -wo 'id\"[^,]*' remove | egrep -v "5af2f031cd5e742e3f776d58|5af2f14ecac88d426a6d7ec9" |  cut -d\" -f3 > remove1

for i in `cat remove1`; do 

  curl --request DELETE \
  --url "https://api.trello.com/1/cards/$i?key=KEY&token=TOKEN"

done

done
