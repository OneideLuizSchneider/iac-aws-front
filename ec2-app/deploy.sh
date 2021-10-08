# update/create VM
cd ./terraform/frontend_next/
terraform init
terraform plan
terraform apply -auto-approve
IP=$(terraform output ip)
#deploy
cd ../../
PATH_KEY="./terraform/iam_key/frontend_next.pem"
USER="ubuntu"
chmod 400 $PATH_KEY
# add ip to know hosts
ssh-keyscan -H $IP >> ~/.ssh/known_hosts
# update and run
scp -i ${PATH_KEY} -r frontend/ ${USER}@${IP}:~/
ssh -tt -i ${PATH_KEY} ${USER}@${IP} sudo docker build -t frontend_next . -f ./frontend/Dockerfile
ssh -tt -i ${PATH_KEY} ${USER}@${IP} sudo docker container rm frontend_next -f
ssh -tt -i ${PATH_KEY} ${USER}@${IP} sudo docker run -d -p 80:3000 --name frontend_next frontend_next
ssh -tt -i ${PATH_KEY} ${USER}@${IP} sudo rm -rf frontend
# IP
echo $IP