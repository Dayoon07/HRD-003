<%@page import="vo.StudentVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	String s_phone = request.getParameter("s_phone");
	String s_gender = request.getParameter("s_gender");
	String s_address = request.getParameter("s_address");
	
	StudentVo vo = new StudentVo();
	vo.setS_no(s_no);
	vo.setS_name(s_name);
	vo.setS_phone(s_phone);
	vo.setS_gender(s_gender);
	vo.setS_address(s_address);
	
	TestDao dao = new TestDao();
	int n = dao.updateStudent(vo);
	
	if (n > 0) {
%>
	<script>
		alert("성공!!!");
	</script>
<%
		response.sendRedirect("/view/studentList.jsp");
	} else {
%>
	<script>
		alert("에러남!!!");
		history.back();
	</script>
<%
	}
%>