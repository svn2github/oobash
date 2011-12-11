source ../../oobash-0.38.6.source

@deprecated
function printer1()
{
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
@deprecated
function printer5() {
   __decoratorCheck "$FUNCNAME" "$@"
   echo "i print printer5"
   echo "---------------------------"
   echo
   return 0
}

printer1
printer2
printer3 Arg1 Arg2
printer4
printer5 
