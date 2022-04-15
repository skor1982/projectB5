data "template_file" "ansible_inventory" {
  template = file("${path.module}/inventory.ini_b533.tpl")
  vars = {
    web_server_name_1 = "foo.example.com"
    web_server_name_2 = "bar.example.com"
    db_server_name_1  = "one.example.com"
    db_server_name_2  = "two.example.com"
    db_server_name_3  = "three.example.com"
    path_key_file     = "~/.ssh/git.pem"
    username          = "ubuntu"
  }
}

resource "null_resource" "update_inventory" {
  triggers = {
    template = data.template_file.ansible_inventory.rendered
  }
  provisioner "local-exec" {
    command = "echo '${data.template_file.ansible_inventory.rendered}' > inventory.ini"
  }
}
