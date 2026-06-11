variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_names" {
  default = [ # database
    "mongodb", "redis","mysql","rabbitmq",
    # backend
    "catalogue","user","cart","shipping","payment",
    # frontend
    "frontend",
    # bastion
    "bastion",
    # forntend-load-balancer
    "frontend_alb",
    # backend-load-balancer
    "backend_alb",
    ## vpn
    "open_vpn"

  ]
}