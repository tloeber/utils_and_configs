.PHONY: ansible
ansible:
	bash install_ansible.sh \
		&& ansible-playbook -i inventory.ini controlNode_setup.yml

.PHONY: machine_setup
machine_setup:
	sudo ansible-playbook -v machine_setup.yml
