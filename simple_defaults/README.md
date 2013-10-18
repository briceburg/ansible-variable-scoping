ansible-variable-scoping
========================

Example that uses role defaults/main.yml instead of vars/main.yml


Using defaults/main.yml vs. vars/main.yml works as documented; meaning roles have their variable definitions take precedence when activated by the dependency mechanism.  If, however, a role uses `include`; the included tasks will use variable definitions from a different role.


This is covered in this example; see the output of the second task below.


**Output**

Test is executed via:

```
ansible-playbook -i hosts playbook.yml
```

```
PLAY [test variable scoping (using defaults vs. vars)] ************************ 

GATHERING FACTS *************************************************************** 
ok: [localhost]

TASK: [test_nested_service | debug msg="test_nested_service port - expected 9000, got {{port}}"] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_nested_service port - expected 9000, got 9000"
}

TASK: [test_nested_service | debug msg="test_nested_service INCLUDE - port - expected 9000, got {{port}}"] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_nested_service INCLUDE - port - expected 9000, got 8080"
}

TASK: [test_service | debug msg="test_service - port - expected 80, got {{port}}"] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_service - port - expected 80, got 80"
}

TASK: [test_app | debug msg="test_app - port - expected 8080, got {{port}}"] *** 
ok: [localhost] => {
    "item": "", 
    "msg": "test_app - port - expected 8080, got 8080"
}
```