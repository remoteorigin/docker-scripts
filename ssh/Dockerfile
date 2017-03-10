FROM rastasheep/ubuntu-sshd:14.04

RUN apt-get update && apt-get install -y rsync
# do not remove /var/lib/apt/lists/ because it is used by shippable

RUN useradd -d /home/shippable -m -s /bin/bash -p \
shippablepwd shippable && echo 'shippable ALL=(ALL) NOPASSWD:ALL' | \
tee -a /etc/sudoers; mkdir -p /home/shippable/.ssh/; \
chown -R $USER:$USER /home/shippable/; \
echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOkDOHxduq6oe7bHfVcsbrNEJl0glftD/KlLmgbXGRMxm9g7da2hvmAXucnGhQnjDibWA9iR3lIkdd1U+FCfy2le5PIhtGZ2CUP8YSyVaHFSCSyyNyVlE+zM3lD2T+qbugqZrdhmwgX3w33UVlrZm8bWqKUvXCmUayOLibMQSVDongcJ5/E4Jn08+H9NLNYr700R4JRuj+pz++XtFtiiBoXJVUU3yAmF8ogUD1D9r9vbvWUbfPKDuzNtbisu4HekCHL8oo/oWFffO6ShJU+TZtrd0fNR3cxRek6mgTPWGbdR0Hpr4rt6j4t8dA/qCyN3e8VVzIBU6x4KV/LKZJYkth 540e55445e5bad6f98764522 \
>> /home/shippable/.ssh/authorized_keys;\
 chown -R shippable:shippable /home/shippable/


 #todo add rsa pub key to env variable for easy updating
 #todo double check security (change/remove default root password)
