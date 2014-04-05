source ../../oobash.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, could not find oobash"
   exit 0
fi

System.out.println

if locale -a | grep ^en_GB.utf8 1>/dev/null 2>&1; then
   LANG=en_GB.utf8
   System.out.println "   My locale is $LANG (english)"
   I18n.out.println "   Example:"
else
   echo "Sorry, locale en_GB.utf8 is not installed."
fi

System.out.println

if locale -a | grep ^de_DE.utf8 1>/dev/null 2>&1; then
   LANG=de_DE.utf8
   System.out.println "   My locale is $LANG (german)"
   I18n.out.println "   Example:"
else
   echo "Sorry, locale de_DE.utf8 is not installed."
fi

System.out.println

if locale -a | grep ^it_IT.utf8 1>/dev/null 2>&1; then
   LANG=it_IT.utf8
   System.out.println "   My locale is $LANG (italian)"
   I18n.out.println "   Example:"
else
   echo "Sorry, locale it_IT.utf8 is not installed."
fi

System.out.println

System.exit 0
