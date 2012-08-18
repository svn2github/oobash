source ../../oobash.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

LANG=en_GB.utf8
I18n.out.println "   Example:"

LANG=de_DE.utf8
I18n.out.println "   Example:"

LANG=it_IT.utf8
I18n.out.println "   Example:"

System.exit 0
