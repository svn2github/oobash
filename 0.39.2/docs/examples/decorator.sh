#!/usr/bin/env bash

source ../../oobash*.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

System.runtime

# START -- My own addon decorator
# Do not use framework commands (e.g. System.out.println) in a decorator !
@false() {
   if (($# != 0)); then
      echo  "I am false and will return 1" >&2
      return 1 
   fi
   return 0
}
# END -- My own addon decorator

@calling
@timestamp
printer1() {
   __decoratorCheck  "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer1"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

@calling
printer2() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer2"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

@deprecated
@calling
@timestamp
printer3() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer3"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

printer4() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer4"
   System.out.println "---------------------------"
   System.out.println
   return 0
}


@false
@calling
printer5() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "My return value is $?, because of @false, but i could be a validator too!"
   System.out.println "i print printer5"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

@runtime
@false
@false
printer6() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "My return value is $?, because of 2 times @false (sum)."
   System.out.println "i print printer6"
   System.out.println "---------------------------"
   System.out.println
   return 0
}


########
# MAIN #
########
printer1
printer2
printer3 Arg1 Arg2
printer4
printer5
printer6

System.exit 0
