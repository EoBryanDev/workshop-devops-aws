variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "workshop-devops-na-nuvem"
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

variable "ecr_repositories" {
  type = list(string)
  default = [ "workshop/production/frontend", "workshop/production/backend" ]
}