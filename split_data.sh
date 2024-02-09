#!/bin/bash

if [[ $2 == "" ]];
then
	echo "usage: ./split_data.sh train_size test_size"
	exit 1
fi

train_size="$1"
test_size="$2"

head -n "$train_size" < label_file > train_label_file
head -n "$train_size" < feat_file > train_feat_file
tail -n "$test_size" < label_file > test_label_file
tail -n "$test_size" < feat_file  > test_feat_file
