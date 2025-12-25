package io.github.wizwix.letsfutsal.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "io.github.wizwix.letsfutsal")
@MapperScan("io.github.wizwix.letsfutsal.mapper")
public class RootConfig {

  @Bean
  public DataSource dataSource() {
    DriverManagerDataSource ds = new DriverManagerDataSource();
    ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
    ds.setUrl("jdbc:mysql://localhost:3306/letsfutsal?serverTimezone=Asia/Seoul");
    ds.setUsername("letsfutsal");
    ds.setPassword("letsfutsal");
    return ds;
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource ds) throws Exception {
    SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
    factory.setDataSource(ds);
    Resource configLocation = new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml");
    factory.setConfigLocation(configLocation);
    return factory.getObject();
  }
}
