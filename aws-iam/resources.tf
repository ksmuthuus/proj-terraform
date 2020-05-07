variable "names" {
  default = ["muthuv", "kamalt", "karthikn"]
}

variable "users" {
  default = {
    ravs : { country : "Netherlands", department : "ABC" },
    tom : { country : "US", department : "DEF" },
    jane : { country : "India", department : "XYZ" }
  }
}


resource "aws_iam_user" "my_iam_users" {
  #count = length(var.names)
  #name  = var.names[count.index]
  # for_each = toset(var.names)
  # name     = each.value

  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    department : each.value.department
  }
}