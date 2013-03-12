Perl_console_template
=====================

Fast simple perl console application template that can accept command line switches but has zero dependencies.

Yet another little template to quickly create perl console apps. This one came about while doing work on 
small embedded systems that had somewhat less than complete perl environments. Rather than constantly trying to 
take parts of getopts along with me onto storage devices that measured in the KB's free, or worse, clumsily 
reinventing parts of it over and over in diverse and wonderful (awful) ways, I decided to take a moment and code
golf a little template that could competently read command line switches.

To use it, simply type in the command line switches you'd like to have recognized into the @options array. The
get_arguments function will read your command line options and place all text that comes between recognized options
into a hash associated with the recognized option that preceded it. If there is no text, the option will still be
present in the hash, allowing you to check if a key is defined to see if the switch was present. Everything else
on the command line is ignored. There are no checks for "valid" options as these will likely be considered values 
of the switch immediately preceding them.

All text occurring before any recognized switches will be in the _default entry in the hash. This lets you do 
something like this:

./Perl_console_template.pl /work/on/this/file --with --these --options

Two examples are given in the main section showing how to read the value passed with a switch and simply detecting
if a switch has been passed.

