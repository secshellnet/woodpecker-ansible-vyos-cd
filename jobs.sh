#!/bin/bash

for host in ${HOSTS}; do
    ansible-playbook vyos.yml --limit ${host} --extra-vars 'ansible_command_timeout=500'
    status=$((status+${?}))
    echo -e "\n\n\n"
done

# exit with code 1 if status (aka error counter) is > 1
[ ${status} -ge 1 ] && exit 1 || exit 0
