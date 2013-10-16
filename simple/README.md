ansible-variable-scoping
========================

Simple example.

**TL;DR**

1. The test_app role depends on the test_service role
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple/roles/test_app/meta/main.yml

1. Each role provides a unique value for a variable named 'shared_var'
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple/roles/test_app/vars/main.yml
  * https://github.com/briceburg/ansible-variable-scoping/blob/master/simple/roles/test_service/vars/main.yml

1. When the test_service role is executed (aka **"active"**), the output of shared_var shows the value defined by the test_app role. **This is contrary to expected/documented behavior (?), where we expect the output to match the value defined by the active role in case of a variable name collision.** 


**Output**

You can test be checking out and executing.

```
ansible-playbook -i hosts playbook.yml
```

Notice that we expect an output of 'test_service var' in the second task, but get 'test_app var' instead!


```
PLAY [test variable scoping] ************************************************** 

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
    "msg": "test_app var"
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
