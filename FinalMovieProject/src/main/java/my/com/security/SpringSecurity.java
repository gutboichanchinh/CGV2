package my.com.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
@Configuration
@EnableWebSecurity
public class SpringSecurity extends WebSecurityConfigurerAdapter {
	
	@Autowired
	UserService1 userService;
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	@Override
	protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService)
		.passwordEncoder(passwordEncoder());
	}
	@Override
	protected void configure (HttpSecurity http) throws Exception{

		http.authorizeRequests()
			.antMatchers("/admin/**").hasAuthority("ADMIN")
			.antMatchers("/").permitAll()
			 .antMatchers("/viewseatchoice").hasAnyAuthority("ADMIN","USER")
		.and()
			.formLogin()
			.loginProcessingUrl("/j_spring_security_check") 
			.loginPage("/openLogin").permitAll()
			.usernameParameter("UserName")
			.passwordParameter("Password") 
			.failureUrl("/openLogin?error")
			.defaultSuccessUrl("/home")
			.permitAll()
		.and()
			.exceptionHandling()
			.accessDeniedPage("/access");

		
		http.logout().logoutSuccessUrl("/home");
		http.csrf().disable();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resourses/**");
	}
}

