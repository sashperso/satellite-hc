satellite_version_check
=========

This role displays the Red Hat Satellite version installed on the main server and capsules. In the case that there is no Red Hat Satellite installed on the capsules, an ignore_errors parameter is set to true to allow the automated health check to continue if none are found.

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
         - satellite_version_check

License
-------

BSD

Author Information
------------------
Sasha Personeni spersone@redhat.com and Elise Elkerton elise@redhat.com
