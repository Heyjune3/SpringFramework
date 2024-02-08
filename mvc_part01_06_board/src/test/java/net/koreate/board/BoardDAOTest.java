package net.koreate.board;

import java.sql.Connection;
import java.util.Date;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.board.dao.BoardDAO;
import com.bitc.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"classpath:spring/root-context.xml"}
		)
public class BoardDAOTest {

	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactory sql;
	
	
//	@Test
//	public void testCreate() {
//		BoardVO board = new BoardVO();
//		board.setBno(1);
//		board.setTitle("ddd");
//		board.setContent("Hello Everyone!");
//		board.setWriter("Lee");
//		board.setRegdate(new Date());
//		
//		int result = bd.create(board);
//		System.out.println("create result : " + result);
//	}
	@Test
	public void connectionPoolTest() throws Exception{
		Connection conn = ds.getConnection();
		System.out.println("test connection : " + conn);
		conn.close();
	}
	
	@Test
	public void sqlSesstionFactoryTest() {
		SqlSession session = sql.openSession();
		System.out.println("SqlSession : " + session);
		BoardVO board = new BoardVO();
		board.setTitle("dddd");
		board.setContent("dddd");
		board.setWriter("dddd");
		board.setRegdate(new Date());
		
		int result = session.insert("BoardMapper.create", board);
		System.out.println("session insert : " + result);
	}
	

}
