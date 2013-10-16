#!/bin/sh

ansible-playbook -i hosts/localhost.inventory application.yml --extra-vars="host_group=localhost namespace=test_app git_branch=master"
