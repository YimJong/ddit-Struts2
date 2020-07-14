package kr.or.ddit.admin.noticeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;


public interface INoticeFileItemService {
	public void insertFileItem(List<FileItemVO> fileitemList);
	public FileItemVO fileItemInfo(Map<String, String> params);
}
