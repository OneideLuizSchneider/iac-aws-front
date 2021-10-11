# detroy bucket and cloudfront
cd ./terraform/
aws s3 rm s3://frontendnext --recursive
terraform destroy -auto-approve