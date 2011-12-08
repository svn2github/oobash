mapfile Arr < $0

#####################
# pseudo decorators #
#####################

@calling()
{
   if (($# != 0))
   then
      echo i am calling "$1"
   fi
   return 0
}

@deprecated()
{
   if (($# != 0))
   then
      echo DeprecatedWarning for "$1" on error channel >&2
   fi
   return 0
}

####################################################
# function to handle decorators, if there are some #
####################################################

decoratorCheck()
{
   local decorated="$1"
   shift
   declare -a lineOffset

   declare -i j=4
   while [[ ${Arr[$((${BASH_LINENO}-$j))]:0:1} == "@" ]]
   do
      lineOffset[$[${#lineOffset[@]}]]=$j
      ((j++))
   done

   declare -i i=0
   for ((i=$((${#lineOffset[@]}-1));i>=0;i--))
   do
      eval ${Arr[$((${BASH_LINENO}-${lineOffset[$i]}))]} "${decorated}" "$@"
   done
   return 0
}

#############
# Functions #
#############

@calling
printer1()
{ 
   decoratorCheck "$FUNCNAME" "$@" 
   echo i print1 because i am a printer1...
   return 0
}

@calling
@deprecated
printer2()
{
   decoratorCheck $FUNCNAME "$@"
   echo i print2 because i am a printer2...
   return 0
}

printer3()
{
   decoratorCheck $FUNCNAME "$@"
   echo i print3 because i am a lonely and not decorated printer3...
   return 0
}

@calling
adder()
{
   decoratorCheck "$FUNCNAME" "$@"
   echo $(( $1 + $2 ))
   return 0
}

########
# main #
########
printer1
printer2
printer3
adder 5 5
