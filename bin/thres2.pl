#! /usr/bin/perl
############################################
#
# Author: 
# Create time: 2016 12�� 22 14ʱ36��12��
# E-Mail: @sogou-inc.com
# version 1.0
#
############################################
my $imageScore;
my $webScore;
my $thres;
my $query;
while(my $line = <>)
{
  chomp $line;
  if($line =~ /\tIMAGE|\tWEB/)
  {
    if($line =~ /^(.*?)\t/)
    {
      $query = $1;
    }
    #next;
  }
  if($line =~ /^(.*?)\t(.*?)imageScore= (.*?) webScore= (.*?) thres= (.*?) /)
  {
    $imageScore = $3;
    $webScore = $4;
    $thres = $5;
    print $query."\t".$imageScore."\t".$webScore."\t".$thres."\n";
  }
}
