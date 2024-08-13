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
	// 스미싱 이미지 관련
	/*
	 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 * // /images/** URL 패턴에 대해 /images/ 디렉토리에서 리소스를 서빙합니다.
	 * registry.addResourceHandler("/images/**").addResourceLocations(
	 * "classpath:/images/"); }
	 */
}