package inquiry.model.vo;

import java.sql.Date;

public class Qna {
		private int boardId;
		private int boardType;
		private int qnaNo;
		private int cateId;
		private String cateName;
		private String boardTitle;
		private String baordContent;
		private String boardWriter;
		private Date createDate;
		private Date modifyDate;
		private int boardCount;
		private String status;
		private String memberId;
		
		public Qna() {}
		
		public Qna(int boardId, int boardType, int qnaNo, int cateId, String cateName, String boardTitle,
				String baordContent, String boardWriter, Date createDate, Date modifyDate, int boardCount,
				String status, String memberId) {
			super();
			this.boardId = boardId;
			this.boardType = boardType;
			this.qnaNo = qnaNo;
			this.cateId = cateId;
			this.cateName = cateName;
			this.boardTitle = boardTitle;
			this.baordContent = baordContent;
			this.boardWriter = boardWriter;
			this.createDate = createDate;
			this.modifyDate = modifyDate;
			this.boardCount = boardCount;
			this.status = status;
			this.memberId = memberId;
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

		public int getQnaNo() {
			return qnaNo;
		}

		public void setQnaNo(int qnaNo) {
			this.qnaNo = qnaNo;
		}

		public int getCateId() {
			return cateId;
		}

		public void setCateId(int cateId) {
			this.cateId = cateId;
		}

		public String getCateName() {
			return cateName;
		}

		public void setCateName(String cateName) {
			this.cateName = cateName;
		}

		public String getBoardTitle() {
			return boardTitle;
		}

		public void setBoardTitle(String boardTitle) {
			this.boardTitle = boardTitle;
		}

		public String getBaordContent() {
			return baordContent;
		}

		public void setBaordContent(String baordContent) {
			this.baordContent = baordContent;
		}

		public String getBoardWriter() {
			return boardWriter;
		}

		public void setBoardWriter(String boardWriter) {
			this.boardWriter = boardWriter;
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

		public int getBoardCount() {
			return boardCount;
		}

		public void setBoardCount(int boardCount) {
			this.boardCount = boardCount;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getMemberId() {
			return memberId;
		}

		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}

		@Override
		public String toString() {
			return "Qna [boardId=" + boardId + ", boardType=" + boardType + ", qnaNo=" + qnaNo + ", cateId=" + cateId
					+ ", cateName=" + cateName + ", boardTitle=" + boardTitle + ", baordContent=" + baordContent
					+ ", boardWriter=" + boardWriter + ", createDate=" + createDate + ", modifyDate=" + modifyDate
					+ ", boardCount=" + boardCount + ", status=" + status + ", memberId=" + memberId + "]";
		}

		
		
		

		
		
		

}
