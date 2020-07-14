package kr.or.ddit.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class MemberListAction implements Action {
	List<MemberVO> memberList;
	private String search_keyword;
	private String search_keycode;
	private String search_mem_add;
	private String search_mem_hp;
	private String search_mem_bir;
	private String currentPage;
	private String blockCount;
	private String pagingHtml;
	private String updateMessage;
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		IMemberService service = IMemberServiceImpl.getInstance();
		
		if(currentPage == null) {
			this.currentPage = "1";
		}
		if(search_keyword == null) {
			this.search_keyword = "";
		}
		if(search_keycode == null) {
			this.search_keycode = "";
		}
		if(search_mem_add == null) {
			this.search_mem_add = "";
		}
		if(search_mem_hp == null) {
			this.search_mem_hp = "";
		}
		if(search_mem_bir == null) {
			this.search_mem_bir = "";
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		params.put("mem_add", search_mem_add);
		params.put("mem_hp", search_mem_hp);
		params.put("mem_bir", search_mem_bir);
		
		String totalCount = service.adminTotalCount(params);
		
		if(blockCount == null) {
			this.blockCount = "10";
		}
		
		RolePaginationUtil pagination = new RolePaginationUtil(request, 
															   Integer.parseInt(this.currentPage), 
															   Integer.parseInt(totalCount),
															   Integer.parseInt(this.blockCount),
															   "/admin/member/memberList.do", 
															   search_keyword, search_keycode);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		this.pagingHtml = pagination.getPagingHtmls();
		
		this.memberList = service.adminMemberList(params);
		
		return SUCCESS;
	}
	
	public List<MemberVO> getMemberList() {
		return memberList;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public void setSearch_mem_add(String search_mem_add) {
		this.search_mem_add = search_mem_add;
	}

	public void setSearch_mem_hp(String search_mem_hp) {
		this.search_mem_hp = search_mem_hp;
	}

	public void setSearch_mem_bir(String search_mem_bir) {
		this.search_mem_bir = search_mem_bir;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setBlockCount(String blockCount) {
		this.blockCount = blockCount;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public String getUpdateMessage() {
		return updateMessage;
	}

	public void setUpdateMessage(String updateMessage) {
		this.updateMessage = updateMessage;
	}

	public String getBlockCount() {
		return blockCount;
	}

	public String getCurrentPage() {
		return currentPage;
	}
}
