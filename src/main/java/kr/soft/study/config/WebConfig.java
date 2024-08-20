package kr.soft.study.config;

import java.io.File;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOrigins("*").allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
				.allowedHeaders("*").allowCredentials(true);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/uploads/**").addResourceLocations("file:./src/main/resources/images/uploads/");
	}
	// ���̽� �̹��� ����
	/*
	 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 * // /images/** URL ���Ͽ� ���� /images/ ���丮���� ���ҽ��� �����մϴ�.
	 * registry.addResourceHandler("/images/**").addResourceLocations(
	 * "classpath:/images/"); }
	 */
}