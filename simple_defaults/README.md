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
localhost                  : ok=5    changed=0    unreachable=0    failed=0 
```