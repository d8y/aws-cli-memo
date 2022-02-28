#!/bin/bash

S3_BUCKET=$1
S3_KEY_PREFIX=$2
GREP_ARG=$3

trap 'exit' 2

S3_KEY_LIST=$(aws s3 ls s3://${S3_BUCKET}/${S3_KEY_PREFIX} --recursiv | awk '{print $4}')

for path in ${S3_KEY_LIST}
do
    # 標準出力
    aws s3 cp s3://${S3_BUCKET}/$path - | grep ${GREP_ARG}
    # ファイル出力
    # aws s3 cp s3://${S3_BUCKET}/$path - | grep ${GREP_ARG} > hoge.txt
done

exit 0