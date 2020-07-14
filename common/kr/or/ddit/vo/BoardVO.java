package kr.or.ddit.vo;

import java.io.File;
import java.util.List;

public class BoardVO {

	private String board_no;
	private String board_index;
	private String board_title;
	private String board_writer;
	private String board_nickname;
	private String board_content;
	private String board_hit;
	private String board_reg_date;
	private String board_delete;
	private String board_group;
	private String board_seq;
	private String board_depth;
	private String rnum;
	private List<FileItemVO> items;
	//전송되는 파일, 파일 컨텐츠 타입, 파일명
		//input type=file name=files
		//전송되는 파일(변수명 필드네임)
		private List<File> files;
		//전송되는 파일 컨텐츠 타입
		//변수 명명규칙 : 필드네임 + ContentType
		private List<String> filesContentType;
		//전송되는 파일명
		//변수 명명규칙 : 필드네임 + FileName
		private List<String> filesFileName;
		
		
	
	
	public List<File> getFiles() {
			return files;
		}
		public List<String> getFilesContentType() {
			return filesContentType;
		}
		public List<String> getFilesFileName() {
			return filesFileName;
		}
		public void setFiles(List<File> files) {
			this.files = files;
		}
		public void setFilesContentType(List<String> filesContentType) {
			this.filesContentType = filesContentType;
		}
		public void setFilesFileName(List<String> filesFileName) {
			this.filesFileName = filesFileName;
		}
		
		
		
	public List<FileItemVO> getItems() {
		return items;
	}
	public void setItems(List<FileItemVO> items) {
		this.items = items;
	}
	
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_index() {
		return board_index;
	}
	public void setBoard_index(String board_index) {
		this.board_index = board_index;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_nickname() {
		return board_nickname;
	}
	public void setBoard_nickname(String board_nickname) {
		this.board_nickname = board_nickname;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(String board_hit) {
		this.board_hit = board_hit;
	}
	public String getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getBoard_delete() {
		return board_delete;
	}
	public void setBoard_delete(String board_delete) {
		this.board_delete = board_delete;
	}
	public String getBoard_group() {
		return board_group;
	}
	public void setBoard_group(String board_group) {
		this.board_group = board_group;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_depth() {
		return board_depth;
	}
	public void setBoard_depth(String board_depth) {
		this.board_depth = board_depth;
	}
	
}
