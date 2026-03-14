variable "tags" {
  type = map(string)
  default = {
    Enviroment = "production"
    Project    = "workshop-devops-nuvem"
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

variable "remote_backend" {
  type = object({
    s3_bucket_name = string
    dynamodb_table_name = string
    dynamodb_table_billing_mode = string
    dynamodb_table_hash_key= string
    dynamodb_table_hash_key_type = string
  })

  default = {
    s3_bucket_name = "workshop-march-remote-bknd-bucket-bryan"
    dynamodb_table_name = "workshop-march-state-locking-table-bryan"
    dynamodb_table_billing_mode = "PAY_PER_REQUEST"
    dynamodb_table_hash_key= "LockID"
    dynamodb_table_hash_key_type = "S"
    
  }
}
