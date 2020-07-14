package kr.or.ddit.user.zipcode.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;

public class IZipcodeDAOImpl implements IZipcodeDAO{

	private SqlMapClient client;
	
	private static IZipcodeDAO dao = new IZipcodeDAOImpl();
	
	private IZipcodeDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipcodeDAO getInstance(){
		return (dao == null) ? dao = new IZipcodeDAOImpl() : dao;
	}
	
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params)
			throws Exception {
		System.out.println("여기까지 들어옴");
		return client.queryForList("zipcode.zipcodeList", params);
	}



}
