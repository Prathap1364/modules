variable "region" {
  description = "describes region name"
  type        = string
  default     = "us-east-1"
}
variable "bucket-name" {
  description = "describes about bucket name"
  type        = string
  default     = "suhaaas13647899008"
}
variable "tags" {
  type = map(string)
  default = {
  }
}