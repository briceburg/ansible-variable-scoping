ansible-variable-scoping
========================

Simple example.

**TL;DR**

1. The test_app role depends on the test_service role
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple_vars/roles/test_app/meta/main.yml

1. Each role provides a unique value for a variable named 'port'
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple_vars/roles/test_app/vars/main.yml
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple_vars/roles/test_service/vars/main.yml

1. When the test_service role is executed (aka **"active"**), the output of port shows the value defined by the test_app role. **This is contrary to expected/documented behavior (?), where we expect the output to match the value defined by the active role in case of a variable name collision.** 


First task in output shows error.

**Output**

Test is executed via:

```
ansible-playbook -i hosts playbook.yml
```

Notice that we expect an output of 'test_service var' in the second task, but get 'test_app var' instead!


```
PLAY [test variable scoping] ************************************************** 

GATHERING FACTS *************************************************************** 
ok: [localhost]

TASK: [test_service | debug msg="test_service - port - expected 80, got 8080"] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_service - port - expected 80, got 8080"
}

TASK: [test_app | debug msg="test_app - port - expected 8080, got 8080"] ****** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app - port - expected 8080, got 8080"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=3    changed=0    unreachable=0    failed=0 

```
