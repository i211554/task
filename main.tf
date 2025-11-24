#dev-infra
module "dev_infra" {
  source= "./infra-app"
  env="dev"
  bucketName="infra-bucket-i211553"
  instance_count=1
  instance_type="t3.micro"
  aws_ami_id="ami-02b8269d5e85954ef"
  hash_key="Student_ID"
}



## CI trigger

