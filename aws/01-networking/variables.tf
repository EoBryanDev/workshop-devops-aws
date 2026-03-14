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
