package information.model.vo;

public class PageInfo {
	private int boardAll;
	private int nowPage;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int firstPage;
	private int lastPage;
	
	public PageInfo() {}

	public PageInfo(int boardAll, int nowPage, int pageLimit, int boardLimit, int maxPage, int firstPage,
			int lastPage) {
		super();
		this.boardAll = boardAll;
		this.nowPage = nowPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.firstPage = firstPage;
		this.lastPage = lastPage;
	}

	public int getBoardAll() {
		return boardAll;
	}

	public void setBoardAll(int boardAll) {
		this.boardAll = boardAll;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	@Override
	public String toString() {
		return "PageInfo [boardAll=" + boardAll + ", nowPage=" + nowPage + ", pageLimit=" + pageLimit + ", boardLimit="
				+ boardLimit + ", maxPage=" + maxPage + ", firstPage=" + firstPage + ", lastPage=" + lastPage + "]";
	}
	
}
