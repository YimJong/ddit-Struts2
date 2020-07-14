package kr.or.ddit.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.MemberVO;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class FileAction implements Action, ModelDriven<MemberVO> {
	//inteceptor-ref = "fileUpload"
	//클라이언트로부터 전송되는 폼필드 (mem_id, mem_pass, mem_name)와 
	//전송되는 파일을 MultipartRequestWrapper자원을 활용 가능
	private MemberVO memberInfo;
	private String file_save_name;
	private String fileName;
	private String file_name;

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String execute() throws Exception {
		/*
		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
		String mem_id = wrapper.getParameter("mem_id");
		String mem_pass = wrapper.getParameter("mem_pass");
		String mem_name = wrapper.getParameter("mem_name");
		
		File[] files = wrapper.getFiles("files");
		String[] contextTypes = wrapper.getContentTypes("files");
		String[] fileNames = wrapper.getFileNames("files");
		*/
		List<File> files = this.memberInfo.getFiles();
		List<String> contentType = this.memberInfo.getFilesContentType(); 
		List<String> fileNames = this.memberInfo.getFilesFileName(); 
		
		
		for(int i=0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() >0){
				File saveFile = new File(GlobalConstant.FILE_PATH, 
										 fileNames.get(i));
				FileUtils.copyFile(targetFile, saveFile);
				//원본 콘텐츠가 대상 파일에 씌여지게 됨 
				this.file_save_name = fileNames.get(i);
			}
		}
			 return SUCCESS;
	}

	@Override
	public MemberVO getModel() {
		this.memberInfo = new MemberVO();
		return this.memberInfo;
	}


	
	
	
	private String contentDisposition;
	private long contentLength;
	private InputStream inputStream;
	
	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public String getfile_save_name() {
		return file_save_name;
	}

	public void setfile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
	public String fileDownload(){
		String res = "";
		try {
			res = new String(this.fileName.getBytes("UTF-8"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File downloadFile = new File(GlobalConstant.FILE_PATH, 
										 this.fileName);
		this.contentDisposition = "attachment;fileName=" + res;
		this.contentLength = downloadFile.length();
		
		try {
			this.inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return "success";
	}

}
