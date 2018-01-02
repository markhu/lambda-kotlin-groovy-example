
account_id="123456789012"  # read from https://console.aws.amazon.com/billing/home?#/account
region="us-west-2"  # ToDo: read from ~/.aws/config file

set -x
aws lambda create-function --region $region --function-name groovy-hello \
	--zip-file fileb://build/libs/jvmlangs-groovy-1.0-SNAPSHOT-all.jar \
	--role arn:aws:iam::$account_id:role/lambda_basic_execution \
	--handler com.aws.blog.jvmlangs.groovy.Main::handler --runtime java8 \
	--timeout 15 --memory-size 128

