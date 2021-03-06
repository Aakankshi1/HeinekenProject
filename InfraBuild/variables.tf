variable "name" {
  description = "Name to use for the instance"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0dd9f0e7df0f0a138"
}

variable "keyname" {
  description = "key Pair Name to use for the instance"
  type        = string
  default     = "k8_mac"
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "vpc_sg_id" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-0388720084829877c"]
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-d665f59a"
}

variable "install_tool" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}


