# AVnotsecurity

why an av is not a all in one security sollution

## Intro

a commen misconception is that having anti-virus software installed is being fully secured.
In this short project i wil show you how anti-virus doesnt detect a data exfiltration using task schedular and powershell.

## setup

For this Project the setup is simple i will use the following:

- windows 10 victim (wil probebly work with window 11)
- azure storage acount
- github repo
- eset internet security (wil propably work with most other but already had a license)

In this scenario we go on the assumption initial access is already achieved.

## working

the scheduled task starts a powershell script that retrieves all its actions from github using invoke webrequest.

we are using a github repository as our command and controll because of the simplicity.

the task file can be found [here](https://github.com/bryanster/AVnotsecurity/tree/main/task).

the task is made to run the powershell script hidden.

when the task runs every hour it wil download its latest script then run it.

because it redownloads the script if i edit it it will always run the latest version.

in this powershell script that is downloaded from github we are mounting the azure storage account and then copying files from the computer to the storage acount.

in this example we are copying the files to the storage account and then deleting them from the computer.

The target file is key.pem but it could be multiple files

script 1.ps1 now downloads the file and removes it without anti-virus giving a warning.
