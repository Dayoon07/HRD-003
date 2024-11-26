package vo;

public class ExamVo {
	private String s_no;
	private String s_grade;
	private String s_class;
	private String s_number;
	private String s_name;
	
	private double e_kor;
	private double e_math;
	private double e_eng;
	private double e_hist;
	
	private double total;
	private double avg;
	private int rank;
	
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_grade() {
		return s_grade;
	}
	public void setS_grade(String s_grade) {
		this.s_grade = s_grade;
	}
	public String getS_class() {
		return s_class;
	}
	public void setS_class(String s_class) {
		this.s_class = s_class;
	}
	public String getS_number() {
		return s_number;
	}
	public void setS_number(String s_number) {
		this.s_number = s_number;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public double getE_kor() {
		return e_kor;
	}
	public void setE_kor(double e_kor) {
		this.e_kor = e_kor;
	}
	public double getE_math() {
		return e_math;
	}
	public void setE_math(double e_math) {
		this.e_math = e_math;
	}
	public double getE_eng() {
		return e_eng;
	}
	public void setE_eng(double e_eng) {
		this.e_eng = e_eng;
	}
	public double getE_hist() {
		return e_hist;
	}
	public void setE_hist(double e_hist) {
		this.e_hist = e_hist;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
