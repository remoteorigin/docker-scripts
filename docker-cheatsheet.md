A list of useful docker commands
================================

- Install docker remotely over ssh `docker-machine create --driver generic --generic-ip-address=35.161.116.223 --generic-ssh-key ~/.ssh/aws-redbull-sentry.pem --generic-ssh-user ubuntu ro0`
- Use docker remotely `eval $(docker-machine env ro0)`
- Launch terminal inside a container `docker exec -it my-app-container bash`
