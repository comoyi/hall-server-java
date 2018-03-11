package com.comoyi.hall.eurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class HallEurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(HallEurekaServerApplication.class, args);
    }

}
