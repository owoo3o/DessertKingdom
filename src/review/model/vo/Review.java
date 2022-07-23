package review.model.vo;

public class Review {
	private int review_no;
	private int class_no;
	private int board_no;
	
	public Review() {
		
	}

	public Review(int review_no, int class_no, int board_no) {
		super();
		this.review_no = review_no;
		this.class_no = class_no;
		this.board_no = board_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", class_no=" + class_no + ", board_no=" + board_no + "]";
	}
	
	
}
