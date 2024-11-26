-- 이미 연습용 테이블은 다 있음
select * from t4_student;

select * from T4_EXAM;

select s_no from t4_student minus select s_no from t4_exam;

select * from T4_STUDENT;

SELECT SUBSTR(S_NO, 1, 5) AS 학번,
	S_NAME AS 이름,
	SUBSTR(S_NO, 1,1) AS 학년,
	SUBSTR(S_NO, 2,2) AS 반,
	SUBSTR(S_NO, 4,5) AS 번호,
	DECODE(S_GENDER, 'M', '남자', 'F', '여자') AS 성별,
	S_PHONE AS 전화번호,
	S_ADDRESS AS 주소
FROM T4_STUDENT;

SELECT A.S_NO, SUBSTR(A.S_NO, 1, 1) S_GRADE, SUBSTR(A.S_NO, 2, 2) S_CLASS, SUBSTR(A.S_NO, 4, 2) S_NUMBER,
	A.S_NAME,
	B.E_KOR,
	B.E_KOR,
	B.E_ENG,
	B.E_MATH,
	B.E_HIST,
	B.TOTAL,
	B.AVG,
	B.RANK
FROM T4_STUDENT A,
	(SELECT S_NO, E_KOR, E_ENG, E_MATH, E_HIST, (E_KOR + E_ENG + E_MATH + E_HIST) TOTAL,
		ROUND((E_KOR + E_ENG + E_MATH + E_HIST) / 4, 2) AVG,
		RANK() OVER(ORDER BY (E_KOR + E_ENG + E_MATH + E_HIST) DESC) RANK FROM T4_EXAM) B
WHERE A.S_NO = B.S_NO(+) ORDER BY A.S_NO;









