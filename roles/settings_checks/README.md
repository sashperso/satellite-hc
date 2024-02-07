Role Name
=========

settings_checks

Discover facts about the Red Hat Satellite settings for use by other roles.

Requirements
------------

Satellite Tool "Hammer" installed and the Ansible user (or becomes_user) is configured to use Hammer as a Red Hat Satellite administrator.
It is assumed the Ansible user will be logging into the Red Hat Satellite servers to use the Hammer tool there.

Role Variables
--------------

See defaults/main.yml for facts that are created by this role.

Dependencies
------------

Nil.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: satellites
      roles:
         - { role: settings_checks }

License
-------

GPL-3.0-only

Author Information
------------------

Red Hat Services - Consulting

