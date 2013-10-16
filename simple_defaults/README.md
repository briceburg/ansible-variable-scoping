ansible-variable-scoping
========================

Simple example, but using defaults/_main.yml  vs. vars/_main.yml

1. Works as expected.

**Output**

You can test be checking out and executing

```
ansible-playbook -i hosts playbook.yml
```

```
PLAY [test variable scoping (using defaults vs. vars)] ************************ 

GATHERING FACTS *************************************************************** 
ok: [localhost]

TASK: [test_service | print service_version] ********************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [test_service | print shared_var  [[ EXPECT > 'test_service var' ]]] **** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_service var"
}

TASK: [test_app | print application_version] ********************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [test_app | print shared_var [[ EXPECT > 'test_app var' ]]] ************* 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app var"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=5    changed=0    unreachable=0    failed=0 
```