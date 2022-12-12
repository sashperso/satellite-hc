# automated_satellite_health_check

The goal of this project is to automate a Satellite 6 health check. This allows a consultant more time for analysis and recommendations, rather than conducting information gathering activities.

## Name
Automated Satellite Health Check

## Description
This project uses Ansible to automate certain components of a RHEL health check.
Two existing Satellite health check template can be found here:
https://gitlab.consulting.redhat.com/customer-success/consulting-engagement-reports/client-cers/viavi-satellite-6-healthcheck

https://gitlab.consulting.redhat.com/customer-success/consulting-engagement-reports/client-cers/asml/2021-01-asml-satellite-healthcheck


## Cloning this repository
To clone this repository and get started on contributing, type the following commands into the CLI:
```
cd existing_repo
git remote add origin https://gitlab.consulting.redhat.com/automated_satellite_hc/automated_satellite_health_check.git
git branch -M main
git push -uf origin main
```
More information on contributing and GitOps can be found in the CONTRIBUTING.md file.

# Project Benefits
### Strengths
- Ansible is agentless, so as long as the controller has an ssh connection (or is local), then it is possible to run an Ansible automated health check across a large fleet.
- Ansible is declarative code, therefore it is easier to read because developers state what they want the program to do, rather than describe how to do it.

### Weaknesses
- The customer will need to install Ansible on their system, in order to use this automated health check.
- There is a dependency on python packages, so their version needs to match what the Ansible interpreter requires.
- The custom and unique nature of Satellite deployments means that this Ansible playbook may need to be amended to ensure all contents of the Satellite deployment are captured.
- This playbook does not autopopulate the CER template. This is an opportunity that can be investigated.

### Opportunities
- More time for the consultant to add value - perform analysis and recommendations, rather than gather information.
- Standardise Sarellite health check engagements at a high level.
- The ability to autopopulate a CER report with the playbook, or covert the findings into a presentation would be a great feature in the future. NOTE: A team in the US has automated CER autopopulation for an OCP health check. The mechanics of the health check are different to the mechanics used in this project, but this may be of use in the future:
https://search-portfolio-hub.6923.rh-us-east-1.openshiftapps.com/serviceskit/openshift_health_check

### Threats
- Lack of adoption due to consultant not being familiar with the tool.
- Will the tool output recommendations? Who owns and takes responsibility for recommendations?
- Product ownership - who will own and maintain this tool?
- Difficulty of advanced features such as CER autopopulation, may require the input of consultants or knowledge-holders with advanced Satellite, CER, Ansible or asciidoc skills.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method. The more documentation the better, and using different modes of documentation can help other contributors or non-technical audiences to understand what has been done.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
The following instructions allow the user to conduct a rhel health check on their local machine.
$ git clone <url>
$ cd ~/rhel
$ ansible-playbook rhel_hc_init.yml -K
Enter root password
$ cat /tmp/rhel_hc_report_<time>_<date>

## Support
- Create a card on the Kanban board for action.
- Email or message any of the contributors for the project.
- Refer to internal Red Hat documents or Red Hat product Google Spaces for advice or extra documentation.

## Roadmap
Milestone 1: Project Started
Date: 12/12/22

## Contributing
We are open to contributions. 
We need designers who can identify problems, and co-create solutions with engineers. We need engineers to build the prototype.

Please read CONTRIBUTING.md for more information.

## License
Refer to the License file for more information.
