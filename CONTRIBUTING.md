# Contributing
When contributing to this repository, please request to join the Kanban board (link below).\
Once a member of the Kanban board, you can pick a task in the backlog and assign it to yourself.\
Once you assign it to yourself, move the task card to "To-Do".\
Once you start working on the task, move the task to "Doing", and utilise the comments feature in the Activity section to keep the team updated.\
Once you have completed your work for the task, move the card into "Code Review".
Along the development journey, please make note of interesting ideas, features, or feedback you encounter for a particular role. This will allow us to add new cards to the research phase, or conceptualise of improvements that can be used in the next iteration of the project. \

#Kanban board
Request to join the following Kanban board in order to see what work is in progress, and what work is to be done. The board gives an idea of the workflow of the project.
https://trello.com/invite/b/y7irZm8i/ATTI4b362186fc08bb7bd4cb1a1fc0b1b5cfB82E8E87/automated-satellite-health-check

# workflow
After you have committed and pushed your changes to the repo, please create a merge request. The code will then be merged into the repository.

# GitOps

This section helps those who are new to using Git. It will take the user through a number of common scenarios which the user is likely to encounter while contributing to this project.

## Cloning the project
Clone a project to begin. When you clone a project, you download the source code into your workstation, so that you can make local changes to the code. Once you are happy with the local changes, you can commit the code up to the remote repository, and create a merge request (asking the owner of the repository to integrate your code with the main branch).

On your workstation, make a directory in which your project will be saved.

```
mkdir git-repos
```

Clone your project.
You can get the url to clone from the web UI, by navigating to the repository, ensuring you are in the appropriate branch, and clicking the blue drop down menu button "Clone" and selecting either the "Clone with SSH" url or the "Clone with HTTPS" url.

```
git clone <url>
```

## Make a new branch
When working with others on a project in GitLab, you may need to use the features of git to enable effective teamwork. One big feature of GitLab is branches which allows members to create a separate instance of the code to edit. Most commonly, this feature is used to develop new features. For the purposes of this project, each health check item is a feature, and therefore new branches will be names after the health check item name.

```
git branch <feature_name>
```

## Push a change
Pushing a change means updating the remote repository with your local changes. The reasons why a developer would do this is to save their work incrementally which is a leading practice. It could also be to update a repository so that you can make a merge request.

```
git status
git add <file_to_add>
git commit -m '<descriptive_message_about_change>
git push --set-upstream origin <branch_name>
```

## Pull changes
Sometimes, you will need to pull changes from the remote repository. E.g. a merge request has been approved. This means that changes that were made into a feature branch have been added to the main branch.

```
git pull
```

## Accidentally adding the wrong file to a git commit
Sometimes you may accidentally add a wrong file to a git commit (git add <wrong_file_name>).
You can correct this mistake by using the git reset <file> command.

```
git reset <incorrect_file_name>
```
