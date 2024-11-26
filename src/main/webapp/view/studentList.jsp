<%@page import="vo.StudentVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<StudentVo> list = dao.getStudentList();
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">학생 조회 / 수정</h2>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>삭제여부</td>
			</tr>
			<%
				if (list != null) {
					for (StudentVo vo : list) {
			%>
			<tr>
				<td><a href="/view/studentUpdate.jsp?s_no=<%= vo.getS_no() %>"><%= vo.getS_no() %></a></td>
				<td><%= vo.getS_name() %></td>
				<td><%= vo.getS_no1() %></td>
				<td><%= vo.getS_class() %></td>
				<td><%= vo.getS_num() %></td>
				<td><%= vo.getS_gender() %></td>
				<td><%= vo.getS_phone() %></td>
				<td><%= vo.getS_address() %></td>
				<td><a href="/view/studentDelete.jsp?s_no=<%= vo.getS_no() %>">삭제하기</a></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</section>

<jsp:include page="/master/footer.jsp" />