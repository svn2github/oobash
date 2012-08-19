source ../../oobash.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

System.out.println

LANG=en_GB.utf8
System.out.println "   My locale is $LANG (english)"
I18n.out.println "   Example:"
I18n.out.println

LANG=de_DE.utf8
System.out.println "   My locale is $LANG (german)"
I18n.out.println "   Example:"
I18n.out.println

LANG=it_IT.utf8
System.out.println "   My locale is $LANG (italian)"
I18n.out.println "   Example:"

System.out.println

System.exit 0
