source ../../oobash.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, could not find oobash"
   exit 0
fi

# START -- My own addon decorator
# Do not use framework commands (e.g. System.out.println) in a decorator !
@false() {
   if (( $# != 0 )); then
      echo  "I am false and will return 1" >&2
      return 1 
   fi
   return 0
}
# END -- My own addon decorator

@runtime
@calling
@timestamp
printer1() {
   __decoratorCheck  "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer1"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

@runtime
@calling
printer2() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "i print printer2"
   System.out.println "---------------------------"
   System.out.println
   return 0
}

@runtime
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
   System.out.println "i print printer4, i am lonely...no decorator at all!"
   System.out.println "---------------------------"
   System.out.println
   return 0
}


@runtime
@false
@calling
printer5() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   System.out.println "I see return value is $?, because of @false. @false could be a validator!"
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
   System.out.println "My return value is $?, because of $? times @false (sum)."
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
# Jump around...decorators still working!
cd /
printer3 Arg1 Arg2
printer4
cd "${__OODIR__}"
printer5
printer6

System.exit 0
