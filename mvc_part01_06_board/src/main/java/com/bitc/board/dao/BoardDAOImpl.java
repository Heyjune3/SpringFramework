package com.bitc.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitc.board.util.Criteria;
import com.bitc.board.vo.BoardVO;

import lombok.RequiredArgsConstructor;

@Repository("bd")
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO {

	private final SqlSession session;
	
	@Override
	public int create(BoardVO board) throws Exception {
		int result = session.insert("BoardMapper.create",board);
		System.out.println("create : " + result);
		return result;
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		BoardVO vo = session.selectOne("BoardMapper.read",bno);
		return vo;
	}

	@Override
	public int update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
