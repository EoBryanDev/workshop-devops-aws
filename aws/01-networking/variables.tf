variable "tags" {
  type = map(string)
  default = {
    Enviroment = "production"
    Project    = "workshop-devops-numvem"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::630434208479:role/zorin-cli-role"
    region = "us-east-2"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    name                     = "workshop-march-tf-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "workshop-march-tf-igw"
    nat_gateway_name         = "workshop-march-tf-ngw"
    public_route_table_name  = "workshop-march-tf-public-rt"
    private_route_table_name = "workshop-march-tf-private-rt"
    public_subnets = [{
      name                    = "workshop-march-tf-public-subnet-us-east-2a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-east-2a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "workshop-march-tf-public-subnet-us-east-2b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-2b"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "workshop-march-tf-private-subnet-us-east-2a"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-east-2a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "workshop-march-tf-private-subnet-us-east-2b"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-2b"
        map_public_ip_on_launch = false
    }]
  }
}

