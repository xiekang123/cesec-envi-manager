package cc.envi.common.config.swagger2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket generalApi(){
        return new Docket(DocumentationType.SWAGGER_2).groupName("general").genericModelSubstitutes(ResponseEntity.class)
                .apiInfo(generalApiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("cc.envi.quartz.controller"))//扫描的包
                .paths(PathSelectors.any())
//                .paths(or(regex("/user/.*")))//过滤
                .build();
    }

    private ApiInfo generalApiInfo() {
        return new ApiInfoBuilder()
                .title(" 接口测试")
                .description("该文档主要提供测试 \r\n\n"
                        + "请求服务:http//localhost:8080/  ）\r\n\n"
                        + "返回：  \r\n\n"
                        + "ReturnBody<T> {\"code\":\"标识码\",\"msg\":\"描述\",data{ 对象  } \r\n\n"
                        + "")
                .contact(new springfox.documentation.service.Contact("lyc", null, null))
                .version("1.0.0")
                .build();
    }
}
