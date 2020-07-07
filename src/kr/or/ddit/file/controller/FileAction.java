package kr.or.ddit.file.controller;

import java.io.File;




import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class FileAction implements Action,ModelDriven<MemberVO> {
	// interceptor-ref="fileUpload"
	// 클라이언트로부터 전송되는 폼 필드(mem_id, mem_name...) 와
	// 전송되는 파일을 MultipartRequestWrapper 자원을 활용 가능하도록 해줌.
	private MemberVO memberInfo;
	private String fileName;
	@Override
	public String execute() throws Exception {
//		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
//		String mem_id = wrapper.getParameter("mem_id");
//		String mem_pass = wrapper.getParameter("mem_pass");
//		String mem_name = wrapper.getParameter("mem_name");
//		
//		File[] files = wrapper.getFiles("files");
//		String[] contentTypes = wrapper.getContentTypes("files");  // 업로드된 파일의 컨텐츠 타입을 취득
//		String[] fileNames = wrapper.getFileNames("files");
		
		List<File> files = this.memberInfo.getFiles();
		List<String> contentType = this.memberInfo.getFilesContentType();
		List<String> fileNames = this.memberInfo.getFilesFileName();
		
		for(int i = 0; i < files.size(); i++) {
			File targetFile = files.get(i);
			if(targetFile.length() > 0) {
				File saveFile = new File(GlobalConstant.FILE_PATH, fileNames.get(i));
				FileUtils.copyFile(targetFile, saveFile); // 첫번째 파라미터  : 원본,  두번째 파라미터 : 원본을 복제할 값    
				this.fileName = fileNames.get(i);
			}
		}
		
		return SUCCESS;
	}
	
	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		return this.memberInfo; // ValueStack에 올림
	}

	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	private String contentDisposition;
	private long contentLength;
	private InputStream inputStream;
	
	public String fileDownload() {
		File downloadFile = new File(GlobalConstant.FILE_PATH, this.fileName);
		
		this.contentDisposition = "attachment;fileName=" +this.fileName;
		this.contentLength = downloadFile.length();
		
		try {
			this.inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return "success";
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	
}
