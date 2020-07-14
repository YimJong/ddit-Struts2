package kr.or.ddit.admin.noticeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;


public interface INoticeFileItemDAO {
	public void isertFileItem(List<FileItemVO> fileitemList) throws Exception;
	public FileItemVO fileItemInfo(Map<String, String> params) throws Exception;
}
