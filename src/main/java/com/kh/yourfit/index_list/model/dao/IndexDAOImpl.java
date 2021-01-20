package com.kh.yourfit.index_list.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		 RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
	        
		return sqlSession.selectList("index.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return sqlSession.selectOne("index.selectNoticeTotalContents");
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return sqlSession.selectOne("index.noticeUpdateView", n_no);
	}
	
	@Override
	public List<Member> selectMemberList() {
		return sqlSession.selectList("index.selectMemberList");
	}

	@Override
	public List<DtBoard> selectDTList() {
		return sqlSession.selectList("index.selectDTList");
	}

	@Override
	public List<ht_board> selectHTList() {
		
		return sqlSession.selectList("index.selectHTList");
	}
	
	@Override
	public List<Map<Product, product_img>> selectProductList() {
		
		return sqlSession.selectList("index.selectProductList");
	}
	
	@Override
	public List<Map<String, String>> selectadBoardList() {
		return sqlSession.selectList("index.selectadBoardList");
	}

	@Override
	public String selectMember() {
		
		return sqlSession.selectOne("index.selectMember");
	}

	@Override
	public int totalContents() {
		
		return sqlSession.selectOne("index.totalContents");
	}

	@Override
	public String selectMember2() {
	
		return sqlSession.selectOne("index.selectMember2");
	}

	@Override
	public String selectMember3() {
	
		return sqlSession.selectOne("index.selectMember3");
	}

	@Override
	public String selectMember4() {
		
		return sqlSession.selectOne("index.selectMember4");
	}

	@Override
	public String selectMember5() {
	
		return sqlSession.selectOne("index.selectMember5");
	}

	@Override
	public int totalContents2() {
	
		return sqlSession.selectOne("index.totalContents2");
	}

	@Override
	public int totalContents3() {
		
		return sqlSession.selectOne("index.totalContents3");
	}

	@Override
	public int totalContents4() {
		
		return sqlSession.selectOne("index.totalContents4");
	}

	@Override
	public int totalContents5() {
		
		return sqlSession.selectOne("index.totalContents5");
	}

	@Override
	public int toAdmin() {
		
		return sqlSession.selectOne("index.toAdmin");
	}

	@Override
	public int diet() {
	
		return sqlSession.selectOne("index.diet");
	}

	@Override
	public int exercise() {
		
		return sqlSession.selectOne("index.exercise");
	}

	@Override
	public int tip() {
	
		return sqlSession.selectOne("index.tip");
	}

	@Override
	public int QA() {
	
		return sqlSession.selectOne("index.QA");
	}


}
