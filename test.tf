locals {
  devs = tolist(toset(var.devs))
}

resource "random_string" "password" {
  count            = length(local.devs)
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "local_file" "test" {
  content = templatefile("${path.module}/test.tpl", {
    passwords = random_string.password
  })
  filename = "${path.module}/test.txt"
}
