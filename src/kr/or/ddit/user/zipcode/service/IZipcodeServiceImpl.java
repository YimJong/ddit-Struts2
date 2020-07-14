package kr.or.ddit.user.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.user.zipcode.dao.IZipcodeDAO;
import kr.or.ddit.user.zipcode.dao.IZipcodeDAOImpl;
import kr.or.ddit.vo.ZipcodeVO;

public class IZipcodeServiceImpl implements IZipcodeService{
	
	private IZipcodeDAO dao;
	
	private static IZipcodeService service = new IZipcodeServiceImpl(); // 이렇게 만들어 주는 이유는?
	
	private IZipcodeServiceImpl(){
		dao = IZipcodeDAOImpl.getInstance();
	}
	
	public static IZipcodeService getInstance(){
		return (service == null) ? service = new IZipcodeServiceImpl() : service;
	}

	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) {
		List<ZipcodeVO> zipcodeList = null;
		try {
			zipcodeList = dao.zipcodeList(params);
			System.out.println("서비스 까지 들어옴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zipcodeList;
	}

}
