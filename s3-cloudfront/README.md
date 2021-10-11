# Deploy Nextjs App
#### Tools

- AWS
  - AWS CLI
  - s3
  - ClouFront
- Terraform
- NodeJS and NPM

#### Steps

- Create an IAM user with the permissions `AmazonS3FullAccess` and `CloudFrontFullAccess`, with just Programmatic access.
- Configure the access key and private key on the file `./terraform/variables.tf`
- To deploy:
  - `sh deploy.sh`
- To destroy everything:
  - `sh destroy.sh`
