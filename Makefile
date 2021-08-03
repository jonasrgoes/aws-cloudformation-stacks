upgrade:
	brew upgrade aws-sam-cli

create-bucket:
	aws s3 mb s3://dev-jonasrgoes --region us-east-1

create-stack:
	aws cloudformation create-stack --stack-name SubStacksTest --tags Organization=Test --template-url template.yaml

build:
	sam build

package:
	sam package --template template.yaml --output-template-file cloudformation.yaml --s3-prefix stacktest --s3-bucket dev-jonasrgoes --region us-east-1

deploy: build package
	aws cloudformation deploy --template-file cloudformation.yaml --stack-name SubStacksTest --region us-east-1 --tags Organization=Test --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND

validate:
	aws cloudformation validate-template --template-url INSERT_URL

describe:
	aws cloudformation describe-stack-events --stack-name SubStacksTest

start-api:
	sam local start-api

delete:
	aws cloudformation delete-stack --stack-name SubStacksTest

log:
	sam logs --stack-name SubStacksTest --name Function1Function

exports:
	aws cloudformation list-exports
