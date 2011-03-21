Lipro - Literate Programming
============================

    (C) 1011 Ben, untar.org

A Perl template for new projects.

****


#toc | Table of Contents  ##


[[#script]]     | 1. The script  
[[#intro]]      | 2. Intro   

#script | Script  ##

_______________________________________
#app >>= the app ###
/--------------------------------------
/
/[[#head]] >> Perl script header
/
/[[#entry]] >> The entry point
/
/[[#main]] >> The main loop
/
/@
[[#toc]] | up


#intro | 2. Intro ##

Literate programming, because coding is not painfull enough.

[[#toc]] | up

____________________________
#entry >>= The entry point### 
|---------------------------
| Calls main, starts the wohle thing
|
~~~~~~~~~~(perl)~~~~~~~~~~~~
main('hell');
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|@
[[#app ]] [[#head]]

____________________________
#main >>= The main loop ### 
|---------------------------
| this is a in code comm
| This is the main loop
| may another time
|
~~~~~~~~~~(perl)~~~~~~~~~~~~

sub main {
    my $name = shift;
    say "hello $name";
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|@
[[#app ]] [[#head]]


#header | 3. Header ##

The most used pragmas and license into:
____________________________________________
#head >>=  Perl header: shebang, pragmas ###
~~~~~~~~~~~(perl)~~~~~~~~~~~~
#!/usr/bin/perl -w
use strict;
use warnings;
use 5.010;

# Copyright (C) 2010 Ben

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|@
[[#app]] 
[[#main]]



