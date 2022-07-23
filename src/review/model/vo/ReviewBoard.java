package review.model.vo;

import java.sql.Date;

public class ReviewBoard {
	private int boardId;
	private int boardType;		// 무슨게시판인지
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private int boardCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public ReviewBoard(int boardId, int boardType, String boardTitle, String boardContent, String boardWriter,
			int boardCount, Date createDate, Date modifyDate, String status) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	private int reviewLike;

	
	public ReviewBoard() {
		
	}

	public ReviewBoard(int boardId, int boardType, String boardTitle, String boardContent, String boardWriter,
			 int boardCount, Date createDate, Date modifyDate, String status, int reviewLike ) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.reviewLike = reviewLike;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	@Override
	public String toString() {
		return "Review [boardId=" + boardId + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardWriter=" + boardWriter + ", boardCount=" + boardCount
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", reviewLike="
				+ reviewLike + "]";
	}

	


	
}
