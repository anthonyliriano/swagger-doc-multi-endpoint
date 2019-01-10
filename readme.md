## swagger-doc-multi-endpoint
Multiple api endpoints at common swagger doc. We can switch among various endpoints on common swagger page. Multiple environment support also possible ie. Dev,Prod

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

### Run application
Execute below command to run docker image

```sh
docker run -p 8080:8080 swagger-multi-endpoint:1
```

Access here
`http://localhost:8080/`
