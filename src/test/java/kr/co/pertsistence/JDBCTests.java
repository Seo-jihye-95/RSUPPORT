package kr.co.pertsistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnecton(){
		try(Connection con =
			DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521/system",
					"rsupport",
					"rsupport"
					)){
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
			log.info("오류");
		}
	}
}
