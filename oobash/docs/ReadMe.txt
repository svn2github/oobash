##########
# oobash #
##########

oobash is a fun project to have a proof of concept for some ideas and no, 
there are no real objects and no real decorators, but who cares... ;-).
There is no downward compatibility until version 1.0.

Fast start
===========

To start simply source oobash.source file:
source oobash.source

After sourcing the file you will see some informations and then you can start to play around - hope you like it.

To finally clean up your environment:
__cleanUp

How it works
=============

A) command_not_found_handle
############################
Every object.method command is not existing. The last step before the bash gives you a "command not found",
is to look if there is a command_not_found_handle function.
This function is part of this framework and is used to handle the object.method situation:
 a) split object.method to "object" and "method" part
 b) check if "object" exists
 c) check if "method" for this object exists
 d) if all checks are fine call the function __$method 
    with the arguments "object" "class" and the other arguments if there are some:
    __$method "$this" "$class" "$@"
All this action makes the framework a relative slow thing, but everything comes at a price...
Because the shell executes the command_not_found_handle function in a separate execution environment, no "setters" are available.
You could echo some setter functionality into the environment, but at the moment, this does not happen to avoid environemnt pollution and
you will not be able to use a setter function in a __function (separate execution environment! all your informations are gone if you jump back to the parent shell).

B) Registry
###########
Every variable, function, array, alias and class is registered in an associative array with the name __Registry__.
With the pulic __cleanUp function this __Registry__ is used to clean the environment.
Use the __cleanUp function after using the oobash.

C) Objectpool and Attributepool
###############################
After using a constructor, let's see what happened:
String a abc

There are two associative arrays :
* __OBJECTPOOL__
------------------
echo ${!__OBJECTPOOL__[@]}
a (key is a, this is the object name)

echo ${__OBJECTPOOL__[@]}
String@1 (value is class@counter)

* __ATTRIBUTEPOOL__
---------------------
echo ${!__ATTRIBUTEPOOL__[@]}
1@string (key is counter@attribute)

echo ${__ATTRIBUTEPOOL__[@]}
abc (value of attribute)

D) Conventions
##############

* Boolean return values:
-------------------------
All public "methods" call a Boolean.TRUE or Boolean.FALSE to represent true or false --> true or false is echoed to the output channel.
If there is no failure calling the "method", the return value will be 0, independent of any boolean true/false return value.

Only private functions and decorators make use of a 0/1 return value to represent a false or true.

E) Own class files and manpages and scripts
############################################

All generators try to use the following optional variables, if you set them:
__AUTHOR__
__COMPANY__
__EMAIL__

a) Create own class files
--------------------------

If you want to make your own class file, 
then use the Class.generator tool.

The tool will return the path and name of the created class file. 

Next time you source the oobash.source, this file gets sourced too. But if you 
want to use it at once after the creation, you certainly can source the file manually.

Example:
Class.generator Person name age city

b) Create own manpages
------------------------

If you want to make your own script
then use the Script.generator tool.

The tool will return the path and name of the created script file. 

1) Call the Script.generator <scriptname>
2) Use the skeleton to write your script
3) Edit embedded pod docs

Example:
Script.generator greatScript.sh

c) Create own scripts
-----------------------

If you want to make a manpage for a generated class file or a generated script, 
then use the Man.generator tool.

The tool will return the path and name of the created man file. 

1) Man.generator <classname> OR <scriptname>

Examples:

Class.generator Person name age
source oobash/src/myClassFiles/Person.oobash
Man.generator Person

OR 

Script.generator greatScript.sh
Man.generator greatScript.sh

F) Methods declaration
######################

All methods begin with two underscore characters (you can see this in the section command_not_found_handle).
Only the constructors/public statics/helpsystem do not follow this main principle (a __String looks to ugly ;-) ).

Even if your method doesn't use any argument, the command_not_found_handle function will add two arguments:
1) objectname
2) class name

Method concatenation like a.toLowerCase.toUpperCase is not possible, but you certainly can simulate this by generating new "objects" e.g.
String a abcA
String a "$(a.toLowerCase)"
String a "$(a.toUpperCase)"
 
G) "Inheritance" 
################
Inheritance is done by array concatenation.
Every class has a __$ClassMethods__ array. The elements of this array are the methods that are defined in this $Class file.
The __$ClassMethods__ arrays are only used for inheritance action.
Every (not abstract) class has another array named: __$Class__. The elements of this array are the elements of one or more __$ClassMethods__ arrays.
e.g.
declare -a __Boolean__=(${__BooleanMethods__[@]} ${__ObjectMethods__[@]} ${__ComparableMethods__[@]})
 
H) Autocompletion
#################

 * for our object.method commands
   -------------------------------
   To use autocompletion aliases are generated in the BASH_ALIASES array: 
   BASH_ALIASES["${this}"."${method}"]=""${this}"."${method}""
   The alias does NOT avoid the "command_not_found" situation,
   it is only existing to be able to enjoy autocompletion.

 * for the help system
   --------------------
   $Class stands for any class name that is used in this framework.
   Following line or similar is there for every $Class.help function.
   complete -W  "$(echo ${__$Class__[@]}) all $Class" $Class.help
   This way an argument wordlist for the $Class.help function is generated and used by the bash autocompletion.  
   The content of the wordlist is every method that can be used by a $Class "object" plus the consructor of the $Class class and the keyword 'all'.

I) I18N
########
The i18n of the bash uses the GNU gettext package (if not existing, there is a fall back to the $"..." syntax).

if you want to make your own oobash.po, oobash.mo file for i18n,
then:

1) create a directory for your locale under oobash/locale
2) copy recursively oobash/locale/de/* to oobash/locale/<yourLocaleDir>/
3) edit the oobash/locale/<yourLocaleDir>/LC_MESSAGES/oobash.po
4) cd into oobash /locale/<yourLocaleDir>/LC_MESSAGES/
5) create your mo file: msgfmt -o oobash.mo oobash.po

If you have some text output that should be translated in your scripts, there are four functions available:

I18n.out.print
I18n.err.print
I18n.out.println
I18n.err.println

You can see a i18n example script in the docs/examples directory.

J) "Decorators"
################
Will only work if shell is used in script.
You can see an example script using "decorators" in the docs/examples directory.
__decoratorCheck calls the "decorators" and returns the sum (if below 256 otherwise $((sum%256)) ) of all decorator return values.
Decorators use stderr for echos, because the framework communication is on stdout.
If you want to create an own decorator function: Do NOT use a framework command (e.g. System.out.println) in this decorator function!

Available decorators:

-@calling
Prints to stderr: 
"Calling: functionname arguments"
Example output:
Calling: printer3 Arg1 Arg2
Returns: 0
Dependeny: None

-@timestamp
Prints to stderr: 
"Time is  "seconds since 1970-01-01 00:00:00 UTC"."nanoseconds (000000000..999999999)" [seconds.nanoseconds]"
or if there is no GNU date:
"Time is "seconds since 1970-01-01 00:00:00 UTC" [seconds]"
Example output:
Time is 1335983081.406097069 [seconds.nanoseconds]
or
Time is 1350311416 [seconds]
Returns: 0
Dependency: GNU date

-@deprecated
Prints to stderr:
"DeprecatedWarning for functionname"
Example output:
DeprecatedWarning for printer3
Returns 0
Dependeny: None

-@runtime
Prints to stderr: 
"Runtime: "seconds since script start" or "seconds.nanoseconds since script start" [seconds.nanoseconds] or [seconds]"
Example output:
Runtime: 0.127926244 [seconds.nanoseconds]
or if there is no bc or GNU date:
Runtime: 3 [seconds]
Returns 0
Dependeny: None for seconds output, bc and GNU date for [seconds.nanoseconds] output

K) Stacktrace
##############
Will only work if shell is not interactive (script).
If there is an exception a stacktrace is shown.
If the shell is interactive and an exception happens, then a "command help" is shown.
You can disable the stacktrace or help function by setting:
__STACKTRACE__="false"
or
__HELP__="false"
in the oobash.source file.
You can see a stacktrace example script in the docs/examples directory.

L) "Exceptions"
################
If you want to use your own exception, you can define name and return value in the associative array:
__ExceptionValues__. This array is defined in the oobash.source file.
Key is the name of the exception and value is the return value.

The different existing exceptions and their return values:

Exception                             ReturnValue
-----------                          -------------
DecoderException                      140
AuthException                         141
IllegalArgumentException              142
IndexOutOfBoundsException             143
IOException                           144
NotInPathException                    145
WrongClassException                   146
ProcessException                      147
Unknown Exception                     250
