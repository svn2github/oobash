#!/usr/bin/env bash

source ../../oobash*.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

# overwrites setting in ../../oobash*.source (but there default is 'true', too)
__STACKTRACE__="true"

f3() {
   System.out.println "Calling Math.adder 3 5 7 z and 'z' will cause an exception:"
   System.out.println
   Math.adder 3 5 7 z
   System.out.println
   return 0
}

f2() {
   f3
   return 0
}

f1() {
   f2
   return 0
}

f1

System.exit 0
