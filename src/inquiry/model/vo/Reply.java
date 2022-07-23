package inquiry.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;
	private String replyStatus;
	private int boardId;
	private String replyWriter;
	private String memberId;
	private Date createDate;
	private Date modifyDate;
	private String replyContent;
	
	public Reply() {}
	
	public Reply(int replyId, String replyStatus, int boardId, String replyWriter, String memberId, Date createDate,
			Date modifyDate, String replyContent) {
		super();
		this.replyId = replyId;
		this.replyStatus = replyStatus;
		this.boardId = boardId;
		this.replyWriter = replyWriter;
		this.memberId = memberId;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.replyContent = replyContent;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", replyStatus=" + replyStatus + ", boardId=" + boardId + ", replyWriter="
				+ replyWriter + ", memberId=" + memberId + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", replyContent=" + replyContent + "]";
	}
	
	
	
	
	
	
	
}
