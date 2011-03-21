#!/usr/bin/perl -wnl
# pre: ls
# cmd: lp2nw.pl article.lp  >| a.nw
# end: notangle -Rtempl a.nw >| a.pl

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
} elsif (/^\/\s*\[\[#(.+)\]\]\s*\>\>\s*(.+)/){ # links snippets
    print "<<$1>> ";
} elsif (/#(\w*)\s*\>>=\s*([^#|.]*)\s*(#*)\s*$/){ # headers(nw)
    print "<<$1>>=";
} elsif (/\/----*/){ # code block open
    print "";
} elsif (/~~~*/){ # code block open
    print "";
} elsif (/^\|\s*----*/){ # code block end
    print "";
} elsif (/^\|\@/){ # nw block end
    print "@";
} elsif (/^\/\@/){ # nw block end
    print "@";
} elsif (/^\/\s*$/){ # nw block end
    print "";
} elsif (/^\/(.*)/){ # nw block end
    print "$1";
} elsif (/^\|(.*)/){ # nw block end
    print "# $1";
} else {
    print;
}

