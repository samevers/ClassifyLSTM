#! /bin/bash
############################################
#
# Author: 
# E-Mail:@sogou-inc.com
# Create time: 2016 12ÔÂ 20 17Ê±44·Ö29Ãë
# version 1.0
#
############################################
nvidia-smi |fgrep Default|awk 'BEGIN{srand()}{
print (NR-1)"\t"substr($13,1,length($13)-1)"\t"rand()
}'|sort -t$'\t' -k 2,2n -k 3,3n|awk -F"\t" 'NR==1{
print "export CUDA_VISIBLE_DEVICES="$1
print "echo $CUDA_VISIBLE_DEVICES"
}' > setdevicesub.sh
. setdevicesub.sh
rm -f setdevicesub.sh


nohup python train.sam.py --rnn_size=128 --num_layers=3 --model=lstm --batch_size=100 --seq_length=20 --save_every=2000 &
#nohup python train.sam.py --rnn_size=128 --num_layers=10 --model=gru --batch_size=100 --seq_length=15 --save_every=2000 &
#nohup python train.sam.py --rnn_size=256 --num_layers=6 --model=lstm --batch_size=50 --seq_length=20 --save_every=2000 &
#nohup python train.sam.py --rnn_size=128 --num_layers=3 --model=gru --batch_size=50 --seq_length=10 --save_every=2000 &
#python predict.py --filename=data/tinyshakespeare/test.10w > tmp/out
#cat tmp/out | perl bin/thres2.pl  > tmp/out.thres
#cat tmp/out.thres | perl bin/sort.pl > tmp/out.thres.sort


# threshold of model <model.ckpt-23495099> is >= 0.006


#cd porn
#cat ../tmp/out.thres.sort | perl bin/porn.pl > ../tmp/out.thres.sort.delPorn
