[webservers]
${web_server_name_1}
${web_server_name_2}

[dbservers]
${db_server_name_1}
${db_server_name_2}
${db_server_name_3}

[all:vars]
ansible_ssh_private_key_file = ${path_key_file}
ansible_ssh_user = ${username}
