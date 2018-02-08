[![Build Status](https://travis-ci.org/sahbi-ktifa/boot-mongo-user-starter.svg?branch=master)](https://travis-ci.org/sahbi-ktifa/boot-mongo-user-starter)

# SpringBoot MongoDB User Starter

Sample starter with user registration using **SpringBoot** + **MongoDB** + **Freemarker** + **WebJars**.

### How to make it run?

* Make sure a MongoDB instance is available locally or configure it using `spring.data.*` properties
 (check https://docs.spring.io/spring-boot/docs/current/reference/html/common-application-properties.html if necessary).
* Run `./gradlew bootRun`

### How does it work?

* See `fr.efaya.boot.config.WebMvcConfig` and `fr.efaya.boot.config.WebSecurityConfig` to see how application is configured
* `fr.efaya.boot.controller.api.RegisterWebServiceController` will handle registration logic
* `login.ftl` and `index.ftl` are the pages available through the app. 
Login page will enable you to register and to login while index one, will simply presents you username that is logged in.
 
