ansible-variable-scoping
========================

Framework example.

**TL;DR**

1. The applications/test_app role depends on the services/test_service role
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/framework/applications/test_app/meta/main.yml

1. Each role provides a unique value for a variable named 'shared_var'
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/framework/applications/test_app/vars/main.yml
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/framework/services/test_service/vars/main.yml )

1. When the services/test_service role is executed (aka **"active"**), the output of shared_var shows the value defined by the applications/test_app role. This is contrary to expected/documented behavior (?), where we expect the output to match the value defined by the active role in case of a variable name collision. 


**Output**

Example Output. You can run the test by checking out and executing ./test.sh


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
