<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">학생 자료 입력</h2>
		<form action="/view/studentInputPro.jsp" method="post" autocomplete="off">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>학번</td>
					<td>
						<input type="text" name="s_no" id="s_no" required> 입력예) 10101
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="s_name" id="s_name" required>
					</td>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="s_phone" id="s_phone" required>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="s_gender" id="s_gender" value="M">남 &nbsp; 						
						<input type="radio" name="s_gender" id="s_gender" value="F">여
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="s_address" id="s_address" required>
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