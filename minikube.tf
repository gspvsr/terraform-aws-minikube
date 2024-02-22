module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "roboshop"
  aws_instance_type = "t3.medium"
  # ~ --> home directory.
  ssh_public_key = "~/gsp.pub"
  aws_subnet_id = "subnet-0318482a7f648763a"
  # ami_image_id = "ami-b81dbfc5" it is no need it will consider by default .
  hosted_zone = "gspaws.online"
  hosted_zone_private = false

  tags = {
    application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}