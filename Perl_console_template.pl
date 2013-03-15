#!/usr/bin/perl 
###############################################################################
# Title   :                                                                   #
# Version :                                                                   #
# Date    :                                                                   #
# Desc.   : Template for a perl console app.                                  #
#                                                                             #
###############################################################################

#### Use ######################################################################
use strict;

###############################################################################
#                        Variables                                            #
###############################################################################
##### From Command Line #####
chomp (my $command_line_text = join(" ", @ARGV));

#### Insert recognized command line options here ####
my @options= ( 
  #the following are examples, replace with your own.
  "--option1",
  "--option2",
  "--option3",
  "-o"
);
#####################################################

##### Local Variables ##### 
my %command_line_options = get_arguments($command_line_text,@options);

###############################################################################
#                        Main Program                                         #
###############################################################################
#Examples:
 #show what was passed behind an option
 print "option1 value passed: $command_line_options{'--option1'}\n";
 #indicate if an option was specified at all
 if ( defined $command_line_options{'--option2'} ) {print "option2 was given\n";}
 print "Default : $command_line_options{'_default'}\n";

###############################################################################
#                        Subs                                                 #
###############################################################################
### print_usage ###########################################################
sub print_usage{
   print "Summary of what the script does.\n";
   print "USEAGE : $0 [options]\n";
   print "  -o [further sub-options] : description of this switch\n";
}
 
### get_arguments #########################################################
# Take the complete text of the arguments and an array of the reconized 
# options, then return a hash of the options and the text associated with each.
sub get_arguments {
  my $argument_text = shift;
   $argument_text =~ s/^ *//; #remove leading spaces;
   $argument_text =~ s/ *$//; #remove trailing spaces;
   $argument_text = " $argument_text "; #add exactly one space to front and back
  my $option_list = join('\s|',@_) . '\s';
  my %output;
  my @detected_options = split (/($option_list)/,$argument_text);
    map(s/^ *//, @detected_options); #remove leading spaces;
    map(s/ *$//, @detected_options); #remove trailing spaces;
  for (my $i=1; $i<=@detected_options-1; $i=$i+2) {
    $output{@detected_options[$i]}=@detected_options[$i+1];
     $output{@detected_options[$i]} =~ s/^ *//; #remove leading spaces;
     $output{@detected_options[$i]} =~ s/ *$//; #remove trailing spaces;
  }
 #Any text that appears before any options should go in the output hash as _default.
  $output{'_default'}=@detected_options[0];
 return %output;
}
