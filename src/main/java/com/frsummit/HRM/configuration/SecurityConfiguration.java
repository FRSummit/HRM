package com.frsummit.HRM.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private DataSource dataSource;

    @Value("${spring.queries.users-query-email}")
    private String usersQueryEmail;

    @Value("${spring.queries.users-query-id}")
    private String usersQueryId;

    @Value("${spring.queries.roles-query-email}")
    private String rolesQueryEmail;

    @Value("${spring.queries.roles-query-id}")
    private String rolesQueryId;

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.
                jdbcAuthentication()
                .usersByUsernameQuery(usersQueryEmail)
                .authoritiesByUsernameQuery(rolesQueryEmail)
                .dataSource(dataSource)
                .passwordEncoder(bCryptPasswordEncoder)
                .and()
                .inMemoryAuthentication().withUser("summit").password("s").authorities("ADMIN");
        auth.
                jdbcAuthentication()
                .usersByUsernameQuery(usersQueryId)
                .authoritiesByUsernameQuery(rolesQueryId)
                .dataSource(dataSource)
                .passwordEncoder(bCryptPasswordEncoder)
                .and()
                .inMemoryAuthentication().withUser("summit").password("s").authorities("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/attendInOutSign").permitAll()
                .antMatchers("/attendance-sign").permitAll()
                .antMatchers("/admin/registration").hasAnyAuthority("ADMIN", "CO-ORDINATOR", "CHAIRMAN", "DEAN")//.hasAuthority("ADMIN")
                .antMatchers("/admin/**").hasAnyAuthority("ADMIN", "VC", "PRO-VC", "CO-ORDINATOR", "CHAIRMAN", "DEAN", "FACULTY")//.hasAuthority("ADMIN")
                .anyRequest().authenticated()
                .and()
                .csrf().disable()
                .formLogin()
                .loginPage("/login").failureUrl("/login?error=true")
//                .defaultSuccessUrl("/admin/home")
                .defaultSuccessUrl("/home")
                .usernameParameter("email")
                .passwordParameter("password")
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/")
                .and()
                .exceptionHandling()
                .accessDeniedPage("/access-denied");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**");
    }
}
