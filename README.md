## Stack
- Spring Boot 2.2.0.RELEASE
- Servlet API 2.5
- JSP, HTML, JS, CSS
- Tomcat 9

## Windows Set up
``` bash
set AV_DATABASE_URL=jdbc:mysql://localhost:3306/AlgorithmVisualization?serverTimezone=UTC
set DATABASE_USER=root
set DATABASE_PASSWORD=test123
set AV_SCHEMA=AlgorithmVisualization
```

## Docker
```bash
docker run -p 3307:3306 -e MYSQL_ROOT_PASSWORD=test123 -e MYSQL_DATABASE=AlgorithmVisualization mysql:5.7
```

## Install
1. To clean and build maven project, use:
    ```bash
    mvn clean install
    ```
2. To create and run the Spring boot application, run the following code:
    ```bash
    $ mvn spring-boot:run
    ```
## License
Project is released under the [MIT](https://en.wikipedia.org/wiki/MIT_License).
