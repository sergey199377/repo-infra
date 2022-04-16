
locals{ 
    vpc_id = "myapp_vpc" 
    region = eu-central-1 
    cluster_name = "myapp-eks-cluster" 
    subnets = ["pub_subnet"] 
    cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"] 
    asg_desired_capacity = 1 
    asg_max_size = 3 
    asg_min_size = 1 
    instance_type = "m4.large" 
    spot_price = "0,20" 
}


module "eks-cluster" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git?ref=v12.1.0"
  cluster_name = local.myapp_eks_cluster
  subnets = local.subnets
  vpc_id  = local.vpc_id
  worker_groups = [
    {
      spot_price = local.spot_price
      asg_desired_capacity = local.asg_desired_capacity
      asg_max_size = local.asg_max_size
      asg_min_size = local.asg_min_size
      instance_type = local.instance_type
      name = "worker-group"
      additional_userdata = "Worker group configurations"
      tags = [{
          key                 = "worker-group-tag"
          value               = "worker-group-1"
          propagate_at_launch = true
      }]
    }
  ]
  map_users = [
      {
        userarn = "arn:aws:iam::AWS_ACCOUNT:myapp_user/AWS_USERNAME"
        username = "AWS_USERNAME"
        groups = ["system:masters"]
      },
    ]
  cluster_enabled_log_types = local.cluster_enabled_log_types
  tags = {
    environment = "prod-env"
  }
}
