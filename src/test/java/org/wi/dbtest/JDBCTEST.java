package org.wi.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

// pom.xml을 통해 JDBC Jar파일을 추가 했고,
// 데이터 베이스(DB)의 연결이 제대로 되었는지 확인할 수 있게 테스트 코드를 작성해서 확인합니다.
public class JDBCTEST {
	// Driver 로드 정보
	String driver = "com.mysql.jdbc.Driver";
	// url 정보
	String url = "jdbc:mysql://localhost:3306/wi?serverTimezone=Asia/Seoul";
	// userID 정보
	String user = "root";
	// password 정보
	String pw = "1234";
	// 드라이브 로드

	// JDBC 연결 테스트를 하기 위한 메소드
	@Test
	public void testConnection() throws Exception{
		Class.forName(driver);
		try(Connection con = DriverManager.getConnection(url,user,pw)){
			System.out.println("DB 연결 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	
		
}
