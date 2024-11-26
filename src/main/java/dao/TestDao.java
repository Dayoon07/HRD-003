package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.ExamVo;
import vo.StudentVo;

public class TestDao {
	
	public ArrayList<StudentVo> getStudentList() {
		ArrayList<StudentVo> list = new ArrayList<StudentVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT S_NO,\r\n"
					+ "	S_NAME,\r\n"
					+ "	SUBSTR(S_NO, 1,1) AS S_NO1,\r\n"
					+ "	SUBSTR(S_NO, 2,2) AS S_CLASS,\r\n"
					+ "	SUBSTR(S_NO, 4,5) AS S_NUM,\r\n"
					+ "	DECODE(S_GENDER, 'M', '남자', 'F', '여자') AS S_GENDER,\r\n"
					+ "	S_PHONE,\r\n"
					+ "	S_ADDRESS\r\n"
					+ "FROM T4_STUDENT"
			);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				StudentVo vo = new StudentVo();
				vo.setS_no(rs.getString("s_no"));
				vo.setS_name(rs.getString("s_name"));
				vo.setS_no1(rs.getString("s_no1"));
				vo.setS_class(rs.getString("s_class"));
				vo.setS_num(rs.getString("s_num"));
				vo.setS_phone(rs.getString("s_phone"));
				vo.setS_gender(rs.getString("s_gender"));
				vo.setS_address(rs.getString("s_address"));
				list.add(vo);
			}
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public StudentVo getStudentNo(int n) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		StudentVo vo = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT * FROM T4_STUDENT WHERE S_NO = ?");
			ps.setInt(1, n);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				vo = new StudentVo();
				vo.setS_no(rs.getString("s_no"));
				vo.setS_name(rs.getString("s_name"));
				vo.setS_phone(rs.getString("s_phone"));
				vo.setS_gender(rs.getString("s_gender"));
				vo.setS_address(rs.getString("s_address"));
			}
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int insertStudent(StudentVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("INSERT INTO t4_student VALUES(?, ?, ?, ?, ?)");
			
			ps.setString(1, vo.getS_no());
			ps.setString(2, vo.getS_name());
			ps.setString(3, vo.getS_phone());
			ps.setString(4, vo.getS_gender());
			ps.setString(5, vo.getS_address());
			
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public int updateStudent(StudentVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"UPDATE T4_STUDENT\r\n"
					+ "	SET s_name = ?, s_phone = ?, s_gender = ?, s_address = ?\r\n"
					+ "	WHERE s_no = ?"
			);
			
			ps.setString(1, vo.getS_name());
			ps.setString(2, vo.getS_phone());
			ps.setString(3, vo.getS_gender());
			ps.setString(4, vo.getS_address());
			ps.setString(5, vo.getS_no());
			
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public ArrayList<ExamVo> scoreList() {
		ArrayList<ExamVo> list = new ArrayList<ExamVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT A.S_NO, SUBSTR(A.S_NO, 1, 1) S_GRADE, SUBSTR(A.S_NO, 2, 2) S_CLASS, SUBSTR(A.S_NO, 4, 2) S_NUMBER,\r\n"
					+ "	A.S_NAME,\r\n"
					+ "	B.E_KOR,\r\n"
					+ "	B.E_KOR,\r\n"
					+ "	B.E_ENG,\r\n"
					+ "	B.E_MATH,\r\n"
					+ "	B.E_HIST,\r\n"
					+ "	B.TOTAL,\r\n"
					+ "	B.AVG,\r\n"
					+ "	B.RANK\r\n"
					+ "FROM T4_STUDENT A,\r\n"
					+ "	(SELECT S_NO, E_KOR, E_ENG, E_MATH, E_HIST, (E_KOR + E_ENG + E_MATH + E_HIST) TOTAL,\r\n"
					+ "		ROUND((E_KOR + E_ENG + E_MATH + E_HIST) / 4, 2) AVG,\r\n"
					+ "		RANK() OVER(ORDER BY (E_KOR + E_ENG + E_MATH + E_HIST) DESC) RANK FROM T4_EXAM) B\r\n"
					+ "WHERE A.S_NO = B.S_NO(+) ORDER BY A.S_NO"
			);
			rs = ps.executeQuery();
			while (rs.next()) {
				ExamVo vo = new ExamVo();
				vo.setS_no(rs.getString("s_no"));
				vo.setS_grade(rs.getString("s_grade"));
				vo.setS_class(rs.getString("s_class"));
				vo.setS_number(rs.getString("s_number"));
				vo.setS_name(rs.getString("s_name"));
				vo.setE_kor(rs.getDouble("e_kor"));
				vo.setE_math(rs.getDouble("e_math"));
				vo.setE_eng(rs.getDouble("e_eng"));
				vo.setE_hist(rs.getDouble("e_hist"));
				vo.setTotal(rs.getDouble("total"));
				vo.setAvg(rs.getDouble("avg"));
				vo.setRank(rs.getInt("rank"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int no) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("DELETE FROM T4_STUDENT WHERE S_NO = ?");
			ps.setInt(1, no);
			no = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public ExamVo getExamVoNo(int no) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ExamVo vo = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT S_NO, E_KOR, E_ENG, E_MATH, E_HIST FROM T4_EXAM WHERE S_NO = ?");
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				vo = new ExamVo();
				vo.setS_no(rs.getString("s_no"));
				vo.setE_kor(rs.getDouble("e_kor"));
				vo.setE_math(rs.getDouble("e_math"));
				vo.setE_eng(rs.getDouble("e_eng"));
				vo.setE_hist(rs.getDouble("e_hist"));
			}
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public ArrayList<ExamVo> getVoidStudentNo() {
		ArrayList<ExamVo> list = new ArrayList<ExamVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ExamVo vo = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT s_no FROM T4_STUDENT MINUS SELECT s_no FROM T4_EXAM");
			rs = ps.executeQuery();
			
			while (rs.next()) {
				vo = new ExamVo();
				vo.setS_no(rs.getString("s_no"));
				list.add(vo);
			}
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int scoreInsert(ExamVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("INSERT INTO T4_EXAM VALUES(?, ?, ?, ?, ?)");
			
			ps.setString(1, vo.getS_no());
			ps.setDouble(2, vo.getE_kor());
			ps.setDouble(3, vo.getE_math());
			ps.setDouble(4, vo.getE_eng());
			ps.setDouble(5, vo.getE_hist());
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}

}
