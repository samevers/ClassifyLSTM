#! /usr/bin/python 
#encoding:gb18030
############################################
#
# Author: 
# E-Mail:@sogou-inc.com
# Create time: 2017 3月 27 18时35分24秒
# version 1.0
#
############################################

import sys,re,os,time
import datetime

regex = re.compile(r'\(epoch (.*)\)')
preEpoch = 0 
for line in sys.stdin:
    line = line.strip()
    m = regex.search(line)    
    if m:
        epoch = m.group(1)
        #print "epoch =",epoch
        if int(epoch) - 1 == int(preEpoch):
            now = datetime.datetime.now()
            now_ =  time.strftime("%Y%m%d%H%M%S")
            command = "cp -rf save save." +  now_
            os.system(command)           
        preEpoch = epoch
#    arr = line.split(" ")
#    if len(arr) == 0:
#        continue
#    info = arr[0]
#    arr  = info.split("/")
#    if len(arr) < 2:
#        continue
#    subProgress = arr[0]
#    total = arr[1]
#    #print subProgress,total
#    if total == subProgress:
#        now = datetime.datetime.now()
#        now_ =  time.strftime("%Y%m%d%H%M%S")
#        command = "cp -rf save save." +  now_
#        os.system(command)
