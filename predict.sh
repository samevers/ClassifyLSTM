#! /bin/bash
############################################
#
# Author: 
# E-Mail:@sogou-inc.com
# Create time: 2016 12�� 20 17ʱ44��29��
# version 1.0
#
############################################
nvidia-smi |fgrep Default|awk 'BEGIN{srand()}{
print (NR-1)"\t"substr($13,1,length($13)-1)"\t"rand()
}'|sort -t$'\t' -k 2,2n -k 3,3n|awk -F"\t" 'NR==1{
print "export CUDA_VISIBLE_DEVICES="$1
print "echo $CUDA_VISIBLE_DEVICES"
}' > setdevicesubp.sh
. setdevicesubp.sh
rm -f setdevicesubp.sh

modelDir=$1
#python predict.py --filename=data/tinyshakespeare/imageTest.dat.noImage.query > save/out
python predict.py --filename=data/tinyshakespeare/test.10w.sample --save_dir ${modelDir} > ${modelDir}/out
#python predict.py --filename=data/tinyshakespeare/test.10w > save/out
cat tmp/out | perl bin/thres2.pl  > tmp/out.thres
cat tmp/out.thres | perl bin/sort2.pl > tmp/out.thres.sort



