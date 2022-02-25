package com.zbin.cisp;

import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.EnableTransactionManagement;


/**
 * Created by Zhouhailin on 2021-11-30
 */
@EnableTransactionManagement
@SpringBootApplication
public class CispApplication {

    public static void main(String[] args) {
        SpringApplication.run(CispApplication.class, args);
    }

    @Bean
    public WebServerFactoryCustomizer<ConfigurableWebServerFactory> webServerFactoryCustomizer() {
        return (container -> {
            ErrorPage error403Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/403");
            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404");
            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500");

            container.addErrorPages(error403Page, error404Page, error500Page);
        });
    }

    @Bean
    public CommandLineRunner init(final RepositoryService repositoryService,
                                  final RuntimeService runtimeService,
                                  final TaskService taskService) {

        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                System.out.println("Number of process definitions : "
                        + repositoryService.createProcessDefinitionQuery().count());
                System.out.println("Number of tasks : " + taskService.createTaskQuery().count());
                runtimeService.startProcessInstanceByKey("oneTaskProcess");
                System.out.println("Number of tasks after process start: "
                        + taskService.createTaskQuery().count());
            }
        };
    }
}

