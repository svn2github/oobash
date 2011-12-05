if (( $# != 1 ))
then
   echo "
         usage:
            $0 classname
         Example:
            $0 String
   "
   exit 0
fi

. ../oobash-0.38.6.source

echo oodir is ${__OODIR__}

class="$1"
echo -en .TH oobash 1 >$class.man1
echo -en " \"$(date "+%d %b %Y")\"" bash4-Environment "User Manuals">>$class.man1
echo -en " \""${__FILENAME__}"\"" >>$class.man1
echo >>$class.man1
echo ".SH NAME" >>$class.man1
for i in $($class.help | grep "-")
do 
   echo -en "$i " | sed 's/-//' >>$class.man1
done
echo >>$class.man1
echo ".SH DESCRIPTION">>$class.man1
echo The ${class}.oobash file is part of the oobash framework. >>$class.man1
