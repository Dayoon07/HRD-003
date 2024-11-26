<%@page import="vo.ExamVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<ExamVo> list = dao.getVoidStudentNo();
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">학생 성적 입력</h2>
		<form action="/view/scoreInputPro.jsp" method="post" autocomplete="off">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>학번</td>
					<td>
						<select name="s_no" id="s_no">
							<%
								if (list != null) {
									for (ExamVo vo : list) {
							%>
							<option value="<%= vo.getS_no() %>"><%= vo.getS_no() %></option>
							<%
									}
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>국어</td>
					<td><input type="text" name="e_kor" id="e_kor" required></td>
				</tr>
				<tr>
					<td>영어</td>
					<td><input type="text" name="e_eng" id="e_eng" required></td>
				</tr>
				<tr>
					<td>수학</td>
					<td><input type="text" name="e_math" id="e_math" required></td>
				</tr>
				<tr>
					<td>한국사</td>
					<td><input type="text" name="e_hist" id="e_hist" required></td>
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