<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	int n = Integer.parseInt(request.getParameter("s_no"));
	dao.delete(n);
	
	if (n > 0) {
%>
	<script>
		alert("삭제 성공");
		location.href = "/view/studentList.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("삭제 실패");
		history.back();
	</script>
<%
	}
%>
