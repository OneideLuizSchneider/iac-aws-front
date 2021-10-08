# Deploy Nextjs App
#### Tools

- AWS
  - ec2
- Terraform

#### Steps

- Create an IAM user with the permissions `AmazonEC2FullAccess`, with just Programmatic access.
- Configure to file `./terraform/variables.tf` whit the access key and private key.
- Create an key-pair on AWS and save it to the directory `./terraform/iam_key/frontend_next.pem`
- Add or change a user and password:
  - Open the file `./ec2-app/frontend/util/auth.js`
  - Change or add users in the const `users`.
  - Optional:
    - To remove the authentication, open the file `./ec2-app/frontend/pages/index.js` and remove the function `getServerSideProps` and the `auth` import.
- To deploy:
  - `sh deploy.sh`
- To change the firewall rules, just edit the file `./terraform/instance.tf` in the resource `aws_security_group` and run:
  - `sh deploy.sh`
- To destroy everything:
  - `sh destroy.sh`
