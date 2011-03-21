#!/usr/bin/perl -wnl
# pre: ls
# cmd: lp2md.pl article.lp  >| a.md && pandoc -s a.md >| a.html
# end: head -n 20 article.lp
# end: chromium-browser a.html

# ls /home/ben/codes/writing.ben/mag.intra/Issue-2010-12/perl_template
#
#
# lp2md.pl
# =======================
#
#     by: Ben, untar.org
#     in: doctools, web, perl
# 

use strict;
use warnings;



if (/#.*\.(\w\w)\s* \/*(.+)/){  # titles
    print "$1 - $2";
} elsif (/\_\_\_\_*/){
    print "";
} elsif (/\[\[(#.+)\]\]\s*\|\s*([\s\w\.]*)/){ # links to headers
    print "[$2]($1)  ";
} elsif (/^\/\s*\[\[#(.+)\]\]\s*\>\>\s*(.+)/){ # links snippets
    print "[_$1_: ](#$1) $2  ";
} elsif (/#(\w*)\s*\|\s*([\s\w\.]*)\s*(#*)\s*$/){ # headers(md)
    print "<h", length($3), " id=$1> $2</h", length($3), ">";
} elsif (/#(.*)\s*\>>=\s*([^#|.]*)\s*(#*)\s*$/){ # headers(nw)
    print "<h", length($3), " id=$1>_$1_: $2</h", length($3), ">";
} elsif (/\[\[\s*#(\w*)\s*\]\]/){ # reference
    print "[$1](#$1)";
} elsif (/\/----*/){ # code block open
    print "";
} elsif (/~~~*\((\w*)/){ # code block open
    print "~~~~~{.$1}";
} elsif (/~~~*$/){ # code block end
    print "~~~~~";
} elsif (/^\|\s*----*/){ # code block end
    print "";
} elsif (/^\|\@/){ # nw block end
    print "";
} elsif (/^\/\@/){ # nw block end
    print "";
} elsif (/^\/\s*$/){ # nw block end
    print "";
} elsif (/^\|(.*)/){ # nw block end
    print "$1";
} else {
    print;
}

