package org.wi.dbtest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wi.Mapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestMapperTest {
	@Autowired
	private TestMapper testMapper;
	
	@Test
	public void testGetTime() {
		System.out.println(testMapper.getTime());
		System.out.println(testMapper.getTime1());
	}
}
