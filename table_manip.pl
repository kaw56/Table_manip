#!usr/bin/perl
# table_manip.pl
use warnings;
use strict;

die "usage: table_manip.pl datafile" unless (@ARGV == 1);

my $filename = shift;
my $out_file = $filename . "output.txt";

open(my $table_file, '<', $filename) or die "can't open file $filename, $!";
open(my $output_file, '>', $out_file) or die "can't open file $filename, $!";

while (my $line = <$table_file>) {
    # use a regex to find the gene name and length
    $line =~ m/(\w+)\s[-\+]\s\d+-\d+\s(\d+)/;

    # print to output file to be used in R
    print $output_file "$1 $2\n";
}

