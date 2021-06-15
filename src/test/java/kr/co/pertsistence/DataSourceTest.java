package kr.co.pertsistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jdk.internal.org.jline.utils.Log;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class DataSourceTest {
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource datasource;
	
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		try (SqlSession session = sqlSessionFactory.openSession();
			Connection con = datasource.getConnection();
			) {

			log.info("네");
			log.info(session);
			log.info(con);
		} catch (Exception e) {

			log.info("아니오");
			fail(e.getMessage());
		}
	}
}
