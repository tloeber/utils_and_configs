.PHONY: ansible
ansible:
	bash install_ansible.sh \
		&& ansible-playbook -i inventory.ini controlNode_setup.yml

machine_setup:
	sudo ansible-playbook -v machine_setup.yml
