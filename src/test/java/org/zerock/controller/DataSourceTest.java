package org.zerock.controller;

import java.sql.Connection;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {
	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() throws Exception {
		
		List<String> list = Arrays.asList("Groovy", "Java", "Scala");
		list.sort((s1, s2) -> s1.length() - s2.length());
		list.forEach(s -> System.out.println(s));
		
		try(Connection con = ds.getConnection()) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
