# User Guide

The following instructions allow the user to conduct a Satellite health check. 

**Please note that to use this playbook, you will have to insert the IP address(es) of the Satellite(s) being checked in both the inventory file and the ansible_hc_init.yml file prior to running the playbook.**

## Cloning the repository

Download the repository locally by completing the following steps:

```
$ git clone <url>
$ cd ~/automated_satellite_health_check
$ ansible-playbook satellite_hc_init.yml -u <root_user> --ask-pass
>Enter root password
$ cat ./satellite_hc_report_<satellite_hostname>
```

Note: If you'd like to run the health check on a disconnected machine (or a machine which doesn't have access to the git repository i.e. for a customer) you can easily transform the repository into a .zip, .gzip or .tar file and place it on the target machine. Then unzip the file and follow the rest of these instructions. All dependencies are included in the project.

## Generating the report

To generate the PDF report, certain elements should be tweaked by the consultant prior to running the script. Instructions for this step are explained below.

### PDF Report Generation Procedure

**IMPORTANT PREREQUISITES**

1. Please ensure that the podman utility is downloaded on your local machine/the machine that you'd like to generate the pdf machine on. You can download this by using:

```
$ sudo yum -y install podman
```

You *may* encounter asciidoc-doctor related errors on the command line that will require you to install newer versions of the asciidoctor utilities. In this case, please refer to the [asciidoctor-pdf](https://github.com/asciidoctor/asciidoctor-pdf) and [asciidoctor-diagram](https://docs.asciidoctor.org/diagram-extension/latest/) documentation for further instructions.

2. Ensure you have changed the customer variables listed in configs/render-vars.adoc prior to commencing the PDF Generation. Likewise, make sure any additional recommendations are placed in the `configs/recommendations.yml` file.

**Config files explained:**
- */comments.yml* --> This file contains the definition of two kinds of pass/fail conditions you may want to include in your report.
- */customer-vars.yml* --> Contains the customer's name. Please edit this!
- */recommendations.yml* --> This is where you can add in specific and targetted recommendations into the report. Each variable corresponds to the respective section in the main `rhel_hc_report.adoc` file.
- *rhel_hc_report.adoc* --> Edit the `:author:` variable to reflect the author(s) names.

**Generating the PDF report:**
```
$ cd ~/automated_satellite_health_check
$ sh generate-pdf -f 'satellite_hc_report"<satellite_hostname>".doc'
```
This will produce a ready-to-use report. If you wish to add any additional sections, topics, or discussion (such as filling out the tables within the document), you will have to edit the .adoc file that is autopopulated by the ansible playbooks. Otherwise, if you think there is an important section missing, feel free to reach out and we can add the feature in.

[NOTE] Use sh generate-pdf -h to learn more about the PDF generation options available to you.

## Customising the Report

There are two main ways you can customise this report to meet the various needs of the engagement or the customer.

[NOTE] If you plan on customising the report, please do so in a forked version of the health check, or locally on your host machine to ensure the base project remains the same :-)

1. **Omitting or adding roles to the health check**

If a role doesn't seem necessary for your health check - for example, the `errata-check` - all you have to do is comment out that role in the `satellite_hc_init.yml ` file. For example:

````
  roles:
    - activation_keys_check
    - auth_sources_check
    - compute_resources_check
    - content_check
    - disk_space_check
#    - errata_check
    - firewall_and_proxy_check
    - high_level_check
    - infrastructure_design_check
    - log_error_check
    - logging_check
    - network_connectivity_check
    - network_resources_check
    - organisations_check
    - qpidd_storage_check
    - registered_host_check
    - remote_execution_check
    - satellite_version_check
    - sync_plan_check
    - system_reqs_check
````

Likewise, if you think there is something missing, or you'd like to include your own check, create a new role under the `roles` directory. You can use  `ansible-galaxy init <role_name>` to automatically set up the role with all necessary directories.

Then, write your check as a seperate role, and then insert it into `satellite_hc_init.yml`.

For example, for a new role called `custom-role` with a custom task, your tasks/main.yml file may look something like this:
````
# tasks/main.yml file for custom-role
---
- name: Run custom command for check
  ansible.builtin.command: echo "This is my special custom role!"
  register: result_custom_check
````

Then to insert the role:
````
  roles:
    - activation_keys_check
    - auth_sources_check
    - compute_resources_check
    - content_check
>   - custom-role
    - disk_space_check
    - errata_check
    - firewall_and_proxy_check
    - high_level_check
    - infrastructure_design_check
    - log_error_check
    - logging_check
    - network_connectivity_check
    - network_resources_check
    - organisations_check
    - qpidd_storage_check
    - registered_host_check
    - remote_execution_check
    - satellite_version_check
    - sync_plan_check
    - system_reqs_check
````
You are then free to add a new section to the rhel_hc_report.adoc template to call the result of the check - i.e. `{{ result_custom_check }}` and to write some insights on what the role's results were or any other guidance.

2. **Editing the report to add in your own check's insights**

The satellite_hc_report.adoc template provides a guideline and general range of checks and advice relating to the management and deployment of Satellite systems. The guidance is designed to be general and high-level. 

That said, if you wish to provide additional comments or insight, you can change the text by using markdown language in the .adoc file in your preferred IDE and save the output. Once the template has been edited to your liking, save the file and then run the ./generate-pdf command.

A helpful guide to using markdown language can be found [here for basic syntax](https://www.markdownguide.org/basic-syntax/) and [here for extended syntax](https://www.markdownguide.org/extended-syntax/).


