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




if (/\s*#\s*cmd\:.*/){ # cmds
    print "";
} elsif (/#sources\s*\>>=\s*(#*)\s*$/){ # headers(nw)
    print '<<*>>=';
} elsif (/^\/\s*\[\[#(.+)\]\]\s*\>\>\s*(\w*\.\w*)/){ # links snippets
    print "<<$2>> ";
} elsif (/^\/\s*\[\[#(.+)\]\]\s*\>\>\s*(.+)/){ # links snippets
    print "<<$1>> ";
} elsif (/#(.*)\s*\>>=\s*(\w*\.\w*)\s*(#*)\s*$/){ # headers(nw)
    print "<<$2>>=";
} elsif (/#(.*)\s*\>>=\s*([\w|\s]*)\s*(#*)\s*$/){ # headers(nw)
    print "<<$1>>=";
} elsif (/\/----*/){ # code block open
    print "";
} elsif (/~~~*\((\w*)/){ # code block open
    print "";
} elsif (/~~~*$/){ # code block end
    print "";
} elsif (/^\|\s*----*/){ # code block end
    print "";
} elsif (/^\|\@/){ # nw block end
    print "@";
} elsif (/^\/\@/){ # nw block end
    print "@";
} elsif (/^\/\s*$/){ # nw block end
    print "";
} elsif (/^\|(.*)/){ # nw block end
    print "$1";
} else {
    print;
}

