source ../../oobash-0.39.source 1>/dev/null 2>&1
if (( $? != 0 )); then
   echo "Sorry, but could not find oobash"
   exit 0
fi

# START -- My own addon decorator
@false() {
   if (($# != 0)); then
      System.err.println "I am false and will return 1"
      return 1 
   fi
   return 0
}
# END -- My own addon decorator

@deprecated
function printer1() {
   __decoratorCheck "$FUNCNAME" "$@"
   echo "i print printer1"
   echo "---------------------------"
   echo
   return 0
}

@calling
function printer2() {
   __decoratorCheck "$FUNCNAME" "$@"
   echo "i print printer2"
   echo "---------------------------"
   echo
   return 0
}

@calling
@timestamp
function printer3() {
   __decoratorCheck "$FUNCNAME" "$@"
   echo "i print printer3"
   echo "---------------------------"
   echo
   return 0
}

function printer4() {
   __decoratorCheck "$FUNCNAME" "$@"
   echo "i print printer4"
   echo "---------------------------"
   echo
   return 0
}


@calling
@timestamp
@false
@deprecated
function printer5() {
   __decoratorCheck "$FUNCNAME" "$@"
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

