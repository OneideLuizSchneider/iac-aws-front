# Deploy Nextjs App
#### Tools

- AWS
  - ec2
- Terraform

#### Steps

- Create an IAM user with the permissions `AmazonEC2FullAccess`, with just Programmatic access.
- Configure to file `./terraform/variables.tf` whit the access key and private key.
- Create an key-pair on AWS and save it to the directory `./terraform/iam_key/frontend_next.pem`
- Generate a user and password using htpasswd:
  - `cd ./proxy && htpasswd -c htpasswd user`
  - Change the param `user` in the end if you want.  
  - There will be a file created with the user: `user` and pass: `pass` which is call `htpasswd`.
  - Optional:
    - To remove the authentication, open the file `./proxy/nginx.conf` and remove the lines `auth_basic_user_file` and `auth_basic`.
- To deploy:
  - `sh deploy.sh`
- To change the firewall rules, just edit the file `./terraform/instance.tf` in the resource `aws_security_group` and run:
  - `sh deploy.sh`
- To destroy everything:
  - `sh destroy.sh`
