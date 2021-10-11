# update/create VM
cd ./terraform/
terraform init
terraform plan
terraform apply -auto-approve
# build
cd ../frontend
npm install -q
npm run build
#deploy
aws s3 sync ./out s3://frontendnext --delete