## swagger-doc-multi-endpoint
Multiple api endpoints at common swagger doc. We can switch among various endpoints on common swagger page. Multiple environment support also possible ie. Dev,Prod

![Demo](sample.png?raw=true "Demo")

### Configure swagger json endpoints
Edit `dist/config.json` to update endpoints and environment details

```json
{
    "env": {
        "dev":[
            {
                "url":"https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/examples/v2.0/json/petstore.json",
                "title":"Petstore Dev"
            },
            {
                "url":"https://raw.githubusercontent.com/tmc/grpc-uber/master/uber.swagger.json",
                "title":"User Dev"
            }
        ],
        "prod":[
            {
                "url":"https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/examples/v2.0/json/petstore.json",
                "title":"Perstore Prod"
            },
            {
                "url":"https://raw.githubusercontent.com/tmc/grpc-uber/master/uber.swagger.json",
                "title":"Uber Prod"
            }
        ]
    }
}
```

### Docker Image
- Openshift compatible
- Runs on nginx web server
- Application runs on port 8080

```dockerfile
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

```

### Run application
Execute below command to run docker image

```sh
docker run -p 8080:8080 swagger-multi-endpoint:1
```

Access here
`http://localhost:8080/`


