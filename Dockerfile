FROM nginx:alpine

ENV USER_NAME nginx
ADD run.sh /run.sh
ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

RUN chgrp -R 0 /etc/nginx && \
    chmod -R g=u /etc/nginx && \
    chgrp -R 0 /var/cache/nginx && \
    chmod -R g=u /var/cache/nginx && \
    chgrp -R 0 /var/run && \
    chmod -R g=u /var/run && \
    chmod g=u /etc/passwd

USER nginx

CMD sh run.sh
