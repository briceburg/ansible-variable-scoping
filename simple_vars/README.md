ansible-variable-scoping
========================

- ansible -devel commit https://github.com/ansible/ansible/commit/214b0b052c3d54b58a531b0f7fb401ec3c0229f5

Description
===


1. alpha role depends on beta role

1. Each role provides a unique value for a variable named 'port' <role>/vars/main.yml

1. When beta role is executed (aka **"active"**) via the role dependency mechanism, the role uses variable definitions from alpha role instead of its own definitions (roles/beta/vars/main.yml). 

1. It has been noted that active roles use their variable definitions [unless higher precedent variables are passed via --extra-vars, or variable definitions in the base playbook]
  * "... within a role, the variables in roles/y/vars/main.yml are guaranteed to be applied to that specific role, just as if they were parameters explicitly passed to the role." ( https://groups.google.com/d/msg/ansible-project/0JIrNlnRXuI/tx1-inKYoUQJ )
  

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

TASK: [beta | debug msg="beta role (tasks/main.yml) - port - expected beta-port, got alpha-port"] *** 
failed: [localhost] => {"failed": true, "failed_when_result": true, "item": "", "verbose_always": true}
msg: beta role (tasks/main.yml) - port - expected beta-port, got alpha-port
...ignoring

TASK: [alpha | debug msg="alpha role (tasks/main.yml) - port - expected alpha-port, got alpha-port"] *** 
ok: [localhost] => {
    "failed": false, 
    "failed_when_result": false, 
    "item": "", 
    "msg": "alpha role (tasks/main.yml) - port - expected alpha-port, got alpha-port"
}

PLAY RECAP ******************************************************************** 
localhost                  : ok=3    changed=0    unreachable=0    failed=0
```

