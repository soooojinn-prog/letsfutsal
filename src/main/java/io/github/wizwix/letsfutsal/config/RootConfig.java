package io.github.wizwix.letsfutsal.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "io.github.wizwix.letsfutsal")
@MapperScan("io.github.wizwix.letsfutsal.mapper")
@EnableTransactionManagement
public class RootConfig {
  @Bean
  public DataSource dataSource() {
    var config = new HikariConfig();
    config.setDriverClassName("com.mysql.cj.jdbc.Driver");
    config.setJdbcUrl("jdbc:mysql://localhost:3306/letsfutsal?serverTimezone=Asia/Seoul&characterEncoding=UTF-8");
    config.setUsername("letsfutsal");
    config.setPassword("letsfutsal");
    config.setMaximumPoolSize(20);

    return new HikariDataSource(config);
  }

  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource ds) throws Exception {
    SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
    factory.setDataSource(ds);

    // MyBatis 설정
    Resource configLocation = new PathMatchingResourcePatternResolver().getResource("classpath:mybatis/mybatis_config.xml");
    factory.setConfigLocation(configLocation);

    return factory.getObject();
  }

  @Bean
  public DataSourceTransactionManager transactionManager(DataSource ds) {
    return new DataSourceTransactionManager(ds);
  }
}
