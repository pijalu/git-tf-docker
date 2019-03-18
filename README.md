# git-tf-docker
this is a docker machine intended to connect to MS TFS server with git-tf project. 

## Security aspect
As some old TFS servers uses outdated SSL implementation, they can require relaxed java security setup in order to permit connection. 

This docker machine can be used as the security change will only affect the container and allows to run git tf in a safer manner against outdated server.

## Env
To allow automation, this docker machine will check for the env variable to automate authentication.
If not present, normal git-tf will be used and credential will be requested when required.

### USERNAME
Username to use

### PASSWORD
Password to use



