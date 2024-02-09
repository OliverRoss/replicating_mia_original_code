#!/bin/bash

output_file="$(date +"%y%m%d%H%M")_results"

n_shadow="20"
target_data_size="10000"
target_learning_rate="0.0000001"
target_batch_size="100"
target_n_hidden="128"
target_epochs="200"
attack_model="nn"
attack_batch_size="100"
attack_n_hidden="64"
attack_epochs="50"
test_feat="./test_feat_file"
train_feat="./train_feat_file"
test_label="./test_label_file"
train_label="./train_label_file"

echo "Saving data for shadow models:" | tee -a "${output_file}"
python attack.py \
	--n_shadow "$n_shadow" \
	--save_data 1 \
	"$train_feat" \
	"$train_label" > "${output_file}" 2>&1

echo "Running attack:" | tee -a "${output_file}"
python attack.py \
	--n_shadow "$n_shadow" \
	--target_data_size "$target_data_size" \
	--target_learning_rate "$target_learning_rate" \
	--target_batch_size "$target_batch_size" \
	--target_n_hidden "$target_n_hidden" \
	--target_epochs "$target_epochs" \
	--attack_model "$attack_model" \
	--attack_batch_size "$attack_batch_size" \
	--attack_n_hidden "$attack_n_hidden" \
	--attack_epochs "$attack_epochs" \
	--test_feat "$test_feat" \
	--test_label "$test_label" \
	"$train_feat" \
	"$train_label" >> "${output_file}" 2>&1 || echo "Exited with error."

