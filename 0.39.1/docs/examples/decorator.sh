source ../../oobash*.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

# if you want to use the @debug function,
# configured normally in the oobash*.source file with foolowing output:
# Runtime + function call
__DEBUG__=true

# START -- My own addon decorator
# Do not use framework commands in a decorator to avoid loops !
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
   echo "i print printer1"
   echo "---------------------------"
   echo
   return 0
}

@calling
printer2() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   echo "i print printer2"
   echo "---------------------------"
   echo
   return 0
}

@deprecated
@calling
@timestamp
printer3() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   echo "i print printer3"
   echo "---------------------------"
   echo
   return 0
}

printer4() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   echo "i print printer4"
   echo "---------------------------"
   echo
   return 0
}


@debug
@false
@calling
@timestamp
printer5() {
   __decoratorCheck "${FUNCNAME[0]}" "${BASH_SOURCE[0]}" "$@"
   echo My return value is $?, because of @false, but i could be a validator too!
   echo "i print printer5"
   echo "---------------------------"
   echo
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
