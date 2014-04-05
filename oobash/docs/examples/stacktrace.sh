source ../../oobash.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, could not find oobash"
   exit 0
fi

# overwrites setting in ../../oobash*.source (but there default is 'true', too)
__STACKTRACE__=true

f3() {
   declare -i returnValue=0
   System.out.println "Calling Math.adder 3 5 7 z and 'z' will cause an exception:"
   System.out.println
   Math.adder 3 5 7 z
   returnValue=$?
   System.out.println
   return $returnValue
}

f2() {
   declare -i returnValue=0
   f3
   returnValue=$?
   return $returnValue
}

f1() {
   declare -i returnValue=0
   f2
   returnValue=$?
   return $returnValue
}

f1
