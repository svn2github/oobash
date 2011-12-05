if (( $# != 1 ))
then
   echo "
         Usage:
            $0 classname
         Example:
            $0 String
   "
   exit 0
fi

mypath=$(dirname ${0})
source ${mypath}/../oobash-*.source
class="$1"
#.\\\" Copyright (c) <$(date +%Y)> <andreas.gregor.frank@googlemail.com>
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
" >${mypath}/man1/$class.man1

echo -en .TH oobash 1 >>${mypath}/man1/$class.man1
echo -en " \"$(date "+%d %b %Y")\"" bash4-Environment "User Manuals">>${mypath}/man1/$class.man1
echo -en " \""${__FILENAME__}"\"" >>${mypath}/man1/$class.man1
echo >>${mypath}/man1/$class.man1
echo ".SH NAME" >>${mypath}/man1/$class.man1
for i in $($class.help | grep "-")
do 
   echo -en "$i " | sed 's/-//' >>${mypath}/man1/$class.man1
done
echo >>${mypath}/man1/$class.man1
echo ".SH DESCRIPTION">>${mypath}/man1/$class.man1
echo The ${class}.oobash file is part of the oobash framework. >>${mypath}/man1/$class.man1
echo ".SH EXAMPLES">>${mypath}/man1/$class.man1
echo "$(${class}.help all)" >>${mypath}/man1/$class.man1
echo ".SH AUTHOR">>${mypath}/man1/$class.man1
echo "Andreas Frank <andreas.gregor.frank@googlemail.com>" >>${mypath}/man1/$class.man1 
# echo $USER >>${mypath}/man1/$class.man1

