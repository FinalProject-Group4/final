package com.kh.yourfit.index_list.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.yourfit.index_list.model.dao.IndexDAO;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	IndexDAO IndexDAO;

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return IndexDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return IndexDAO.selectNoticeTotalContents();
	}

	@Override
	public Notice noticeUpdateView(int n_no) {
		
		return IndexDAO.noticeUpdateView(n_no);
	}
	
	@Override
	public List<Member> selectMemberList() {

		return IndexDAO.selectMemberList();
	}

	@Override
	public List<DtBoard> selectDTList() {
		return IndexDAO.selectDTList();
	}

	@Override
	public List<ht_board> selectHTList() {
		
		return IndexDAO.selectHTList();
	}
	
	@Override
	public List<Map<Product, product_img>> selectProductList() {
		
		return IndexDAO.selectProductList();
	}
	
	@Override
	public List<Map<String, String>> selectadBoardList() {
		return IndexDAO.selectadBoardList();
	}

	@Override
	public String selectMember() {
		
		return IndexDAO.selectMember();
	}

	@Override
	public int totalContents() {
		
		return IndexDAO.totalContents();
	}

	@Override
	public String selectMember2() {
		
		return IndexDAO.selectMember2();
	}

	@Override
	public String selectMember3() {
		
		return IndexDAO.selectMember3();
	}

	@Override
	public String selectMember4() {
		
		return IndexDAO.selectMember4();
	}

	@Override
	public String selectMember5() {
		
		return IndexDAO.selectMember5();
	}

	@Override
	public int totalContents2() {
	
		return IndexDAO.totalContents2();
	}

	@Override
	public int totalContents3() {
	
		return IndexDAO.totalContents3();
	}

	@Override
	public int totalContents4() {
		
		return IndexDAO.totalContents4();
	}

	@Override
	public int totalContents5() {
		
		return IndexDAO.totalContents5();
	}

	@Override
	public int toAdmin() {
		
		return IndexDAO.toAdmin();
	}

	@Override
	public int diet() {
		
		return IndexDAO.diet();
	}

	@Override
	public int exercise() {
		
		return IndexDAO.exercise();
	}

	@Override
	public int tip() {
		
		return IndexDAO.tip();
	}

	@Override
	public int QA() {
		
		return IndexDAO.QA();
	}
	
	

}
