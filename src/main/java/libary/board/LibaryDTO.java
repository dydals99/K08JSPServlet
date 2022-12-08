package libary.board;

public class LibaryDTO {
	private String book_code;
	private String book_genre;
	private String book_title;
	private String book_author;
	
	public String getBook_code() {
		return book_code;
	}
	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}
	public String getBook_genre() {
		return book_genre;
	}
	public void setBook_genre(String book_genre) {
		this.book_genre = book_genre;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_Status() {
		return book_Status;
	}
	public void setBook_Status(String book_Status) {
		this.book_Status = book_Status;
	}
	private String book_Status;
}
