package kr.or.ddit.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.user.sumnail.service.FreeboardServiceImpl;
import kr.or.ddit.user.sumnail.service.IFreeboardService;
import kr.or.ddit.utiles.FileUploadRequestWrapper;
import kr.or.ddit.vo.BoardVO;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class sumnailFileAction implements Action, ModelDriven<BoardVO> {

	// intercepter-ref = "fileUpload"
	// 클라이언트로부터 전송되는 폼필드(mem_id, mem_pass, mem_name)와
	// 전송되는 파일을 MultipartRequestWrapper 자원을 활용 가능
	
	private BoardVO boardInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
//		MultiPartRequestWrapper wrapper = (MultiPartRequestWrapper) ServletActionContext.getRequest();
//		String mem_id = wrapper.getParameter("mem_id");
//		String mem_pass = wrapper.getParameter("mem_pass");
//		String mem_name = wrapper.getParameter("mem_name");
//		
//		File[] files = wrapper.getFiles("files");
//		String[] contentTypes = wrapper.getContentTypes("files");
//		String[] fileNames = wrapper.getFileNames("files");

		IFreeboardService service = FreeboardServiceImpl.getInstance();
		service.insertFreeboard(this.boardInfo);
		
/*		
		List<File> files = this.boardInfo.getFiles();
		List<String> contentType = this.boardInfo.getFilesContentType();
		List<String> fileNames = this.boardInfo.getFilesFileName();
		
		for(int i=0; i<files.size(); i++){
			File targetFile = files.get(i);
			if(targetFile.length() > 0){
				File saveFile = new File(GlobalConstant.FILE_PATH, fileNames.get(i));
				FileUtils.copyFile(targetFile, saveFile);
				this.fileName = fileNames.get(i);
			}
		}*/
		
		return SUCCESS;
	}

	@Override
	public BoardVO getModel() {
		this.boardInfo = new BoardVO();
		return this.boardInfo;
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
	
	public String fileDownload(){
		File downloadFile = new File(GlobalConstant.FILE_PATH, this.fileName);
		this.contentDisposition = "attachment;fileName="+this.fileName;
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


	public void setBoardInfo(BoardVO boardInfo) {
		this.boardInfo = boardInfo;
	}

	
	
	
	
}
