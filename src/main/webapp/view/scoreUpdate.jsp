<%@page import="vo.ExamVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	request.setCharacterEncoding("UTF-8");
	int n = Integer.parseInt(request.getParameter("s_no"));
	String name = request.getParameter("s_name");
	ExamVo vo = dao.getExamVoNo(n);
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">학생 성적 수정</h2>
		<form action="/view/scoreUpdatePro.jsp" method="post" autocomplete="off">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>학번</td>
					<td>
						<input type="text" name="s_no" id="s_no" value="<%= vo.getS_no() %>" required readonly>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="s_name" id="s_name" value="<%= name %>" required>
					</td>
				</tr>
				<tr>
					<td>국어</td>
					<td>
						<input type="text" name="e_kor" id="e_kor" value="<%= vo.getE_kor() == 0 ? "" : vo.getE_kor() %>" required>
					</td>
				</tr>
				<tr>
					<td>영어</td>
					<td>
						<input type="text" name="e_eng" id="e_eng" value="<%= vo.getE_eng() == 0 ? "" : vo.getE_eng() %>" required>
					</td>
				</tr>
				<tr>
					<td>수학</td>
					<td>
						<input type="text" name="e_math" id="e_math" value="<%= vo.getE_math() == 0 ? "" : vo.getE_math() %>" required>
					</td>
				</tr>
				<tr>
					<td>한국사</td>
					<td>
						<input type="text" name="e_hist" id="e_hist" value="<%= vo.getE_hist() == 0 ? "" : vo.getE_hist() %>" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">저장하기</button>
						<button type="reset">다시입력</button>
					</td>
				</tr>
			</table>
		</form>
	</section>

<jsp:include page="/master/footer.jsp" />