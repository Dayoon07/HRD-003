<%@page import="vo.StudentVo"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	String s_phone = request.getParameter("s_phone");
	String s_gender = request.getParameter("s_gender");
	String s_address = request.getParameter("s_address");
	
	TestDao dao = new TestDao();
	StudentVo vo = new StudentVo();
	vo.setS_no(s_no);
	vo.setS_name(s_name);
	vo.setS_phone(s_phone);
	vo.setS_gender(s_gender);
	vo.setS_address(s_address);

	int n = dao.insertStudent(vo);

	if (n > 0) {
%>
<script>
	alert("입력 성공함");
	location.href = "/view/studentList.jsp";
</script>
<%
	} else {
%>
<script>
	alert("입력 실패");
	history.back();
</script>
<%
	}
%>