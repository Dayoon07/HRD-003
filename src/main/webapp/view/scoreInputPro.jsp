<%@page import="vo.ExamVo"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	TestDao dao = new TestDao();
	int n = 0;
	
	String s_no = request.getParameter("s_no");
	double e_kor = Double.parseDouble(request.getParameter("e_kor"));
	double e_eng = Double.parseDouble(request.getParameter("e_eng"));
	double e_math = Double.parseDouble(request.getParameter("e_math"));
	double e_hist = Double.parseDouble(request.getParameter("e_hist"));
	
	ExamVo vo = new ExamVo();
	vo.setS_no(s_no);
	vo.setE_kor(e_kor);
	vo.setE_eng(e_eng);
	vo.setE_math(e_math);
	vo.setE_hist(e_hist);
	
	dao.scoreInsert(vo);
	if (n >= 0) {
		response.sendRedirect("/view/scoreList.jsp");
	} else {
%>
	<script>
		alert("입력실패");
		history.back();
	</script>
<%
	}
%>