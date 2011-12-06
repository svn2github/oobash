if (( $# != 1 ))
then
   echo "
         Ugly tool, but i hope it works for you...
         Usage:
            $0 classname
         Example:
            $0 String
   "
   exit 0
fi
class="$1"
mypath=$(dirname ${0})
source ${mypath}/../oobash-*.source
destination="${mypath}/man1/$class.1"

echo "
.\\\" Copyright (c) <$(date +%Y)> <$USER>
.\\\"
.\\\" Permission is hereby granted, free of charge, to any person obtaining a copy
.\\\" of this software and associated documentation files (the \"Software\"), to deal
.\\\" in the Software without restriction, including without limitation the rights
.\\\" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
.\\\" copies of the Software, and to permit persons to whom the Software is
.\\\" furnished to do so, subject to the following conditions:
.\\\"
.\\\" The above copyright notice and this permission notice shall be included in
.\\\" all copies or substantial portions of the Software.
.\\\"
.\\\" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
.\\\" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
.\\\" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
.\\\" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
.\\\" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN110G FROM,
.\\\" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
.\\\" THE SOFTWARE.
" >${destination}

echo -en .TH oobash 1 >>${destination}
echo -en " \"$(date "+%d %b %Y")\"" bash4-Environment "User Manuals">>${destination}
echo -en " \""${__FILENAME__}"\"" >>${destination}
echo >>${destination}
echo ".SH NAME" >>${destination}
for i in $($class.help | grep "-")
do 
   echo -en "$i " | sed 's/-//' >>${destination}
done
echo >>${destination}
echo ".SH DESCRIPTION">>${destination}
echo The ${class}.oobash file is part of the oobash framework. >>${destination}
echo ".SH EXAMPLES">>${destination}
echo "$(${class}.help all)" >>${destination}
echo ".SH AUTHOR">>${destination}
echo $USER >>${destination}

gzip ${destination}
