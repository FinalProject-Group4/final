package com.kh.yourfit.index_list.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.dtboard.model.vo.DtBoard;
import com.kh.yourfit.ht_board.model.vo.ht_board;
import com.kh.yourfit.index_list.model.service.IndexService;
import com.kh.yourfit.member.model.vo.Member;
import com.kh.yourfit.notice.model.vo.Notice;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_img.model.vo.product_img;

@Controller
public class Index_Controller {
	
	@Autowired
	IndexService indexService;
	
	
	/*index 공지사항 목록*/
	@RequestMapping("/index.do")
	public String selectNoticeListIndex(@RequestParam(value= "cPage",
	                                required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = indexService.selectNoticeList(cPage, numPerPage);
		List<Member> mlist = indexService.selectMemberList();
		List<DtBoard> dlist = indexService.selectDTList();
		List<ht_board> hlist = indexService.selectHTList();
		List<Map<Product, product_img>> plist = indexService.selectProductList();
		List<Map<String, String>> adlist = indexService.selectadBoardList();
		
		int totalContents = indexService.selectNoticeTotalContents();
		
		 String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "notice_list.do");
		    
		    System.out.println("list : " + list);
		    
		    model.addAttribute("adlist", adlist);
		    model.addAttribute("dlist", dlist);
		    model.addAttribute("hlist", hlist);
		    model.addAttribute("mlist", mlist);
		    model.addAttribute("plist", plist);
		    model.addAttribute("list", list);
		    model.addAttribute("totalContents", totalContents);
		    model.addAttribute("numPerPage", numPerPage);
		    model.addAttribute("pageBar", pageBar);
		    
			return "/index";
	}
	
	 @RequestMapping("/indexupdate.do")
	    public String noticeUpdateViewIndex(@RequestParam int n_no, Model model) {
	    
	        Notice notice = indexService.noticeUpdateView(n_no);
	        
	        model.addAttribute("notice", notice);
	        
	        return "/index";
	    
	    }
	 /*index 공지사항 목록 끝*/
	 
	    @RequestMapping("/top5.do")
		public String co_board(Model model) { 

	    	String Member = indexService.selectMember();
	    	String Member2 = indexService.selectMember2();
	    	String Member3 = indexService.selectMember3();
	    	String Member4 = indexService.selectMember4();
	    	String Member5 = indexService.selectMember5();
	    	
			int totalContents = indexService.totalContents();
			int totalContents2 = indexService.totalContents2();
			int totalContents3 = indexService.totalContents3();
			int totalContents4 = indexService.totalContents4();
			int totalContents5 = indexService.totalContents5();
			
			int toAdmin = indexService.toAdmin();
			int diet = indexService.diet();
			int exercise = indexService.exercise();
			int tip = indexService.tip();
			int QA = indexService.QA();
			
			
			/*model.addAttribute("Member",Member);*/
			model.addAttribute("Member",Member);
			model.addAttribute("totalContents",totalContents);
			model.addAttribute("totalContents2",totalContents2);
			model.addAttribute("totalContents3",totalContents3);
			model.addAttribute("totalContents4",totalContents4);
			model.addAttribute("totalContents5",totalContents5);
			model.addAttribute("toAdmin", toAdmin);
			model.addAttribute("diet", diet);
			model.addAttribute("exercise", exercise);
			model.addAttribute("tip", tip);
			model.addAttribute("QA", QA);
			
			return "/top5";
		}
	
}