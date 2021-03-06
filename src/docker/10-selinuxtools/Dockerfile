FROM fedora:23
RUN dnf upgrade -y && \
    dnf install -y iptables openssh-server rsync sudo vim less ca-certificates && \
    dnf install -y psmisc htop git make gcc findutils && \
    dnf install -y selinux-policy-devel setools-console setools-devel

RUN git clone https://github.com/rancher/refpolicy.git /usr/src/refpolicy
RUN cd /usr/src/refpolicy && git submodule init && git submodule update && \
    sed -i '/MONOLITHIC = y/c\MONOLITHIC = n' build.conf && \
    make conf && make && make install-headers

RUN rm -rf /etc/ssh/*key*
RUN rm -fr /sbin/poweroff  /sbin/shutdown /sbin/reboot /sbin/halt /usr/sbin/poweroff  /usr/sbin/shutdown /usr/sbin/reboot /usr/sbin/halt
COPY build/entry.sh build/console.sh build/docker-init build/update-ssh-keys build/rancheros-install /usr/sbin/
RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8
RUN groupadd --gid 1100 rancher && \
    groupadd --gid 1101 docker && \
    useradd -u 1100 -g rancher -G docker,wheel -m -s /bin/bash rancher && \
    useradd -u 1101 -g docker -G docker,wheel -m -s /bin/bash docker && \
    echo ClientAliveInterval 180 >> /etc/ssh/sshd_config && \
    echo '## allow password less for rancher user' >> /etc/sudoers && \
    echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo '## allow password less for docker user' >> /etc/sudoers && \
    echo 'docker ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/docker.dist /usr/bin/docker
COPY prompt.sh /etc/profile.d/
ENTRYPOINT ["/usr/sbin/entry.sh"]
