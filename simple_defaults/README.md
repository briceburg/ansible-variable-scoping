ansible-variable-scoping
========================

Simple example, but using defaults/_main.yml  vs. vars/_main.yml

1. Everything works as expected EXCEPT when we include a task file (in the test_nested_service). The included task outputs the wrong variable definition.

**Output**

You can test be checking out and executing

```
ansible-playbook -i hosts playbook.yml
```

```
PLAY [test variable scoping (using defaults vs. vars)] ************************ 

GATHERING FACTS *************************************************************** 
ok: [localhost]

TASK: [test_nested_service | print nested_service service_version (expect 9.0)] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "9.0"
}

TASK: [test_nested_service | print nested_service port (expect 9000)] ********* 
ok: [localhost] => {
    "item": "", 
    "msg": "9000"
}

TASK: [test_nested_service | FROM_INCLUDE > print nested_service port (expect 9000)] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "8080"
}

TASK: [test_service | print test_service service_version (expect 0.0)] ******** 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [test_service | print test_service port (expect 80)] ******************** 
ok: [localhost] => {
    "item": "", 
    "msg": "80"
}

TASK: [test_app | print application_version] ********************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "0.0"
}

TASK: [test_app | print test_app port (expect 8080)] ************************** 
ok: [localhost] => {
    "item": "", 
    "msg": "8080"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=8    changed=0    unreachable=0    failed=0
```