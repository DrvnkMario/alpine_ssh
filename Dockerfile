FROM alpine:latest

COPY ./entrypoint.sh /

RUN apk update \
    && apk add --no-cache openssh \
    && apk add --no-cache python3 \
    && echo '# Default configuration:' >> etc/ssh/sshd_config \
    && echo 'Port 22' >> /etc/ssh/sshd_config \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \ 
    && echo 'PermitEmptyPasswords yes' >> /etc/ssh/sshd_config \
    && echo 'root:' | chpasswd  


ENTRYPOINT ["/entrypoint.sh"]
