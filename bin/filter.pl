#! /usr/bin/perl -w
############################################
#
# Author: 
# Create time: 2017 3�� 20 12ʱ33��37��
# E-Mail: @sogou-inc.com
# version 1.0
#
############################################
#!/usr/bin/perl


while(my $line = <>)
{
    chomp $line;
    $line =~ s/\x{A3}(.)/chr(ord($1) - 128)/eg;
    if($line =~ /[a-zA-Z]+/)
    {
        print "SKIP\t".$line."\n";
    }else
    {
        print $line."\n";
    }
}
