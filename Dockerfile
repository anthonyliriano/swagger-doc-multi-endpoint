FROM nginx:1.15-alpine

LABEL maintainer="haritkumar@hotmail.com"

ENV PORT 8080
ENV BASE_URL ""

COPY ./docker/nginx.conf /etc/nginx/

COPY ./dist/* /usr/share/nginx/html/
COPY ./docker/run.sh /usr/share/nginx/

RUN chmod +x /usr/share/nginx/run.sh && \
    chown -R 1001:1001 /usr/share/nginx && chmod -R 777 /usr/share/nginx && \
    chown -R 1001:1001 /etc/nginx && chmod -R 777 /etc/nginx && \
    chown -R 1001:1001 /var/cache/nginx && chmod -R 777 /var/cache/nginx && \
    chown 1001:1001 /var/run && chmod -R 777 /var/run

USER 1001

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/run.sh"]
