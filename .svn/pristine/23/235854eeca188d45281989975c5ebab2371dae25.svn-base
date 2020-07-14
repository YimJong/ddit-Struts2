package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.user.zipcode.service.IZipcodeService;
import kr.or.ddit.user.zipcode.service.IZipcodeServiceImpl;
import kr.or.ddit.vo.ZipcodeVO;

import com.opensymphony.xwork2.Action;

public class zipcodeSearchResultAction{

	private String dong;
	private String jsonData;
	private List<ZipcodeVO> zipcodeList;

	
	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("dong", this.dong);
		
//	 	웹 애플리케이션 : 테이블 1개당 service, dao, vo 하나씩 맵핑.
		IZipcodeService service = IZipcodeServiceImpl.getInstance();
	 	this.zipcodeList = service.zipcodeList(params);
		   
        // 	   json 형식 문자열 완성
	 	
        ObjectMapper jsonDataConverter = new ObjectMapper();
        
        try {
			String jsonData = jsonDataConverter.writeValueAsString(zipcodeList);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        	   
        	   
	 	return "success";
	}
	
	



	public List<ZipcodeVO> getZipcodeList() {
		return zipcodeList;
	}





	public String getJsonData() {
		return jsonData;
	}





	public void setDong(String dong) {
		this.dong = dong;
	}
	
	

	   
	   
	   
}
