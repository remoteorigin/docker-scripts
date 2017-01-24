# Docker Installation

### Install docker remotely over ssh

    docker-machine create --driver generic --generic-ip-address=35.161.116.223 --generic-ssh-key ~/aws-server-sentry.pem --generic-ssh-user ubuntu server-sentry`

- `generic-ip-address` = IP of your server
- `generic-ssh-key` = SSH `.pem` key file for the server
    - before using move to your desired location and sets its access rights (required)
    - example: `chmod 400 aws-server-sentry.pem`
- `server-sentry` = name of remote machine used in the future for identification

### Use docker remotely

See available machines

    docker-machine ls
    
and then choose which machine to use

    eval $(docker-machine env server-sentry)

### Launch terminal inside a container

    docker exec -it container-name bash
