ansible-variable-scoping
========================

Example Output. We expect print shared_var from the test_service task to output "test_service var", but instead it outputs "test_app var"


```
[deploy application test_app] ******************************************** 

GATHERING FACTS *************************************************************** 
ok: [localhost]
localhost: not importing file: /home/nesta/ansible-variable-scoping/applications/test_app/vars/master.yml

TASK: [../services/test_service | print service_name] ************************* 
ok: [localhost] => {
    "item": "", 
    "msg": "test_service"
}

TASK: [../services/test_service | print service_version] ********************** 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [../services/test_service | print shared_var] *************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app var"
}

TASK: [applications/test_app | print application_name] ************************ 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app-master"
}

TASK: [applications/test_app | print application_version] ********************* 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [applications/test_app | print shared_var] ****************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app var"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=7    changed=0    unreachable=0    failed=0 
