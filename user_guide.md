# User Guide

Perform a health check on Satellites and Capsules and create an adoc report for each host.
Optionally convert the adoc reports into PDFs.
As you will see you may perform the health check many times to add customer specific recommendations into the next iteration of the reports, or directly edit the adoc reports prior to converting them to PDFs.

## Quick Start
**Generate health check reports:**  
- add the Satellites and Capsules to _inventory_
- add customer details to _configs/document-vars.adoc_
- add custom recommendations to _configs/recommendations.yml_
- run health check playbook
`ansible-playbook satellite_hc_init.yml -u <user> --ask-pass`

**Convert adoc report to PDF:**
- install the _podman_ package locally
- ensure the image _quay.io/redhat-cop/ubi8-asciidoctor:v2.0_ is accessible or cloned to a local registery
- update the _IMAGE_ variable in the script _generate-pdf.sh_ to the above image
- add/update recommendations in the adoc reports
- convert *each* adoc to PDF
`generate-pdf.sh -f satellite_hc_report_<hostname>.adoc`


## Running the Playbook

```
$ git clone <url>
$ cd ~/automated_satellite_health_check
$ ansible-playbook --user <user> --ask-pass --ask-become-pass satellite_hc_init.yml
>Enter <user> password

# List and review reports
$ ls -l ./satellite_hc_report_*.adoc
$ less ./satellite_hc_report_<hostname>.adoc
```

Note: If you'd like to run the health check on a disconnected machine (or a machine which doesn't have access to the git repository i.e. for a customer) you can easily transform the repository into a .zip, .gzip or .tar file and place it on the target machine. Then unzip the file and follow the rest of these instructions.

## Generating the report

To generate the PDF report, elements should be tweaked by the consultant prior to running the script. Instructions for this step are explained below.

### PDF Report Generation Procedure

**IMPORTANT PREREQUISITES**

1. Please ensure that the podman utility is downloaded on your local machine/the machine that you'd like to generate the pdf machine on. You can download this by using:

```
$ sudo yum -y install podman
```

You *may* encounter asciidoc-doctor related errors on the command line that will require you to install newer versions of the asciidoctor utilities. In this case, please refer to the [asciidoctor-pdf](https://github.com/asciidoctor/asciidoctor-pdf) and [asciidoctor-diagram](https://docs.asciidoctor.org/diagram-extension/latest/) documentation for further instructions.

2. Ensure you have changed the customer variables listed in configs/document-vars.adoc prior to commencing the PDF Generation. Likewise, make sure any additional recommendations are placed in the `configs/recommendations.yml` file.

**Config files explained:**
- _configs/comments.yml_ --> This file contains the definition of two kinds of pass/fail conditions you may want to include in your report.
- _configs/customer-vars.yml_ --> Contains the customer's name. Please edit this!
- _configs/recommendations.yml_ --> Customer specific and targetted recommendations for the report. Each variable corresponds to the respective section in the template _satellite_hc_report.adoc._
- _templates/satellite_hc_report.adoc_ --> Edit the `:author:` variable to reflect the author's/authors' name(s).

**Generating the PDF report:**
```
$ cd ~/automated_satellite_health_check
$ chmod a+x generate-pdf.sh
$ ./generate-pdf.sh -f 'satellite_hc_report"<satellite_hostname>".adoc'
```
This will produce a ready-to-use report. If you wish to add any additional sections, topics, or discussion (such as filling out the tables within the document), you will have to edit the .adoc file that is autopopulated by the ansible playbooks. Otherwise, if you think there is an important section missing, feel free to reach out and we can add the feature in.

[NOTE] Use `generate-pdf.sh -h` to learn more about the PDF generation options available to you.

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
    - registered_host_check
    - remote_execution_check
    - satellite_version_check
    - sync_plan_check
    - system_reqs_check
````
You are then free to add a new section to the rhel_hc_report.adoc template to call the result of the check - i.e. `{{ result_custom_check }}` and to write some insights on what the role's results were or any other guidance.

2. **Editing the report to add in your own check's insights**

The satellite_hc_report.adoc template provides a guideline and general range of checks and advice relating to the management and deployment of Satellite systems. The guidance is designed to be general and high-level. 

That said, if you wish to provide additional comments or insight, you can change the text by using markdown language in the .adoc file in your preferred IDE and save the output. Once the template has been edited to your liking, save the file and then run the ./generate-pdf.sh command.

A helpful guide to using markdown language can be found [here for basic syntax](https://www.markdownguide.org/basic-syntax/) and [here for extended syntax](https://www.markdownguide.org/extended-syntax/).


