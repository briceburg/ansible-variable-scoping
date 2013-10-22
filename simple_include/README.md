ansible-variable-scoping
========================

Description
===


1. alpha role depends on beta role

1. Each role provides a unique value for a variable named 'port' in <role>/defaults/main.yml

1. When beta role is executed (aka **"active"**) via the role dependency mechanism, the role uses its variable definitions for tasks in tasks/main.yml, but alpha role's definitions for tasks that are included! 


Output
===

Test is executed via:

```
ansible-playbook -i hosts playbook.yml
```


```
PLAY [test variable scoping] ************************************************** 

GATHERING FACTS *************************************************************** 
ok: [localhost]

TASK: [beta | debug msg="beta role (tasks/main.yml) - port - expected beta-port, got {{port}}"] *** 
ok: [localhost] => {
    "failed": false, 
    "failed_when_result": false, 
    "item": "", 
    "msg": "beta role (tasks/main.yml) - port - expected beta-port, got beta-port"
}

TASK: [beta | debug msg="beta role (tasks/include.yml) - port - expected beta-port, got {{port}}"] *** 
failed: [localhost] => {"failed": true, "failed_when_result": true, "item": "", "verbose_always": true}
msg: beta role (tasks/include.yml) - port - expected beta-port, got alpha-port
...ignoring

TASK: [alpha | debug msg="alpha role (tasks/main.yml) - port - expected alpha-port, got {{port}}"] *** 
ok: [localhost] => {
    "failed": false, 
    "failed_when_result": false, 
    "item": "", 
    "msg": "alpha role (tasks/main.yml) - port - expected alpha-port, got alpha-port"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=4    changed=0    unreachable=0    failed=0
```
