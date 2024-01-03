high_level_check
=========

This role conducts an network resources check. It does this by checking for and listing lifeccle environments content views & activation keys

Requirements
------------

N/A

Role Variables
--------------

N/A

Dependencies
------------

The dependencies for this role are the other roles listed in the Satellite 6 Health Check report playbook and the satellite_hc_report.j2 file. Please note that changes to the section of the report calling the variables registered by this role may break the final report. If you choose to omit this role, please ensure you delete the variable in the satellite_hc_report.j2 file, or replace with a default variable instead.


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - content_check

License
-------

BSD

Author Information
------------------

Sasha Personeni spersone@redhat.com and Elise Elkerton elise@redhat.com
