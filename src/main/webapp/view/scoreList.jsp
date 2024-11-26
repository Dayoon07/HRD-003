<%@page import="vo.ExamVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<ExamVo> list = dao.scoreList();
	
	double sKor = 0;
	double sEng = 0;
	double sMath = 0;
	double sHist = 0;
	double sAvg = 0;
	double count = 0;
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">성적 조회 / 수정</h2>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>이름</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>석차</td>
			</tr>
			<%
				if (list != null) {
					for (ExamVo vo : list) {
			%>
			<tr>
				<td><%= vo.getS_grade() %></td>
				<td><%= vo.getS_class() %></td>
				<td><%= vo.getS_number() %></td>
				<td>
					<a href="/view/scoreUpdate.jsp?s_no=<%= vo.getS_no() %>&s_name=<%= vo.getS_name() %>">
						<%= vo.getS_name() %>
					</a>
				</td>
				<td><%= vo.getE_kor() == 0 ? "" : vo.getE_kor() %></td>
				<td><%= vo.getE_eng() == 0 ? "" : vo.getE_eng() %></td>
				<td><%= vo.getE_math() == 0 ? "" : vo.getE_math() %></td>
				<td><%= vo.getE_hist() == 0 ? "" : vo.getE_hist() %></td>
				<td><%= vo.getTotal() == 0 ? "" : vo.getTotal() %></td>
				<td><%= vo.getAvg() == 0 ? "" : vo.getAvg() %></td>
				<td><%= vo.getRank() == 0 ? "" : vo.getRank() %></td>
				<%
					sKor += vo.getE_kor();
					sEng += vo.getE_eng();
					sMath += vo.getE_math();
					sHist += vo.getE_hist();
					sAvg += vo.getAvg();
					if (vo.getAvg() != 0) {
						count++;
					}
				%>
			</tr>
			<%
					}
			%>
			<tr>
				<td colspan="4">과목별 합</td>
				<td><%= sKor %></td>
				<td><%= sEng %></td>
				<td><%= sMath %></td>
				<td><%= sHist %></td>
				<td><%= sKor + sEng + sMath + sHist %></td>
				<td><%= String.format("%.2f", sAvg/count) %></td>
				<td></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>

<jsp:include page="/master/footer.jsp" />