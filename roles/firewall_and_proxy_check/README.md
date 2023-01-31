firewall_and_proxy_check
=========

This role checks all open firewall ports on the Satellite server.

Requirements
------------

N/A

Role Variables
--------------

This role checks for open firewall ports against a list of ports in the vars/main.yml file.

Dependencies
------------

The dependencies for this role are the other roles listed in the Satellite 6 Health Check report playbook and the satellite_hc_report.j2 file. Please note that changes to the section of the report calling the variables registered by this role may break the final report. If you choose to omit this role, please ensure you delete the variable in the satellite_hc_report.j2 file, or replace with a default variable instead.


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - firewall_and_proxy_check

License
-------

BSD

Author Information
------------------

Sasha Personeni spersone@redhat.com and Elise Elkerton elise@redhat.com
