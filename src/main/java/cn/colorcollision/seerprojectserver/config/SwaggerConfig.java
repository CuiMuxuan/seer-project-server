package cn.colorcollision.seerprojectserver.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author 爻
 * @date 2022/12/30
 * @design swagger3配置文件，使用/swagger-ui/#访问
 */
@Configuration
public class SwaggerConfig {
    @Bean
    public OpenAPI springShopOpenAPI() {
        return new OpenAPI()
                .info(info())
/*添加对JWT对token的支持(本步骤可选) 在添加OpenApiConfig类上添加Components信息：然后在OpenApi中注册Components:*/
                .components(components())
                .externalDocs(externalDocumentation());
    }

    private License license() {
        return new License()
                .name("MIT")
                .url("https://opensource.org/licenses/MIT");
    }

    private Info info() {
        return new Info()
                .title("Cui Muxuan's Open API")
                .description("开发者使用的程序接口")
                .version("v0.0.1")
                .license(license());
    }

    private ExternalDocumentation externalDocumentation() {
        return new ExternalDocumentation()
                .description("Cui Muxuan's bilibili place")
                .url("https://space.bilibili.com/589465087");
    }

    /* 添加对JWT对token的支持(本步骤可选)
     在添加OpenApiConfig类上添加Components信息：*/
    private Components components() {
        return new Components()
                .addSecuritySchemes("Authorization", new SecurityScheme().type(SecurityScheme.Type.HTTP).scheme("bearer").bearerFormat("JWT"));
    }
    /*然后在OpenApi中注册Components:*/
/*    @Bean
    public OpenAPI springShopOpenAPI2() {
        return new OpenAPI()
                .info(info())
                .components(components())
                .externalDocs(externalDocumentation());
    }
    */
//    /*在需要使用Authorization的接口上添加：*/
//    @Operation(security = { @SecurityRequirement(name = "bearer-key") })

//    @Bean
//    public Docket docket(){
//
//        return new Docket(DocumentationType.OAS_30)
//                .apiInfo(apiInfo())
//                .enable(enable)
//                .groupName("User")
//                .select()
//                .apis(RequestHandlerSelectors.basePackage("cn.colorcollision.seerprojectserver.controller"))
//                .paths(PathSelectors.any())
//                .build()
//                .securitySchemes(Collections.singletonList(tokenScheme()))
//                .securityContexts(Collections.singletonList(tokenContext()));
//    }
//
//
//    @SuppressWarnings("all")
//    public ApiInfo apiInfo(){
//        return new ApiInfo(
//                "seerproject's api",
//                "redis project",
//                "v1.0",
//                "848675521@qq.com", //开发者团队的邮箱
//                "seerproject",
//                "Apache 2.0",  //许可证
//                "http://www.apache.org/licenses/LICENSE-2.0" //许可证链接
//        );
//    }
//    private HttpAuthenticationScheme tokenScheme() {
//        return HttpAuthenticationScheme.JWT_BEARER_BUILDER.name("Authorization").build();
//    }
//
//    private SecurityContext tokenContext() {
//        return SecurityContext.builder()
//                .securityReferences(Collections.singletonList(SecurityReference.builder()
//                        .scopes(new AuthorizationScope[0])
//                        .reference("Authorization")
//                        .build()))
//                .operationSelector(o -> o.requestMappingPattern().matches("/.*"))
//                .build();
//    }
}