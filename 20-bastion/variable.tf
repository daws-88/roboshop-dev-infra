variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_names" {
  default = [ # database
    "mongodb", "redis", "mysql", "rabbitmq",
    # bavkend
    "catalogue", "user", "cart", "shipping", "payment",
    # frontend
    "frontend",
    # bastion
    "bastion",
  ]
}