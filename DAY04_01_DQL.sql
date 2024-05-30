/*
  GROUP BY 절
  1. 같은 값을 가진 데이터들을 하나의 그룹으로 묶어서 처리한다.
  2. 대부분 통계 함수와 함께 사용한다.
    1) 합계 : SUM(표현식)
    2) 평균 : AVG(표현식)
    3) 최대 : MAX(표현식)
    4) 최소 : MIN(표현식)
    5) 개수 : COUNT(칼럼) 또는 COUNT(*)
  3. 주의사항
    GROUP BY 절에서 명시한 칼럼만 SELECT 절에서 조회할 수 있다.
*/

-- 1. 학생별로 수강신청을 몇 건 했는지 조회하기
SELECT stu_no, COUNT(*)
  FROM enroll_t
 WHERE stu_no IS NOT NULL
 GROUP BY stu_no;

-- 2. 과목별로 몇 명의 학생이 신청했는지 조회하기
SELECT subj_no, COUNT(*)
  FROM enroll_t
 WHERE stu_no IS NOT NULL
 GROUP BY subj_no;

/*
  HAVING 절
  1. GROUP BY 절과 함께 사용하기 위한 조건절이다.
  2. 통계 함수 결과에 조건을 지정할 때 주로 사용한다.
*/

-- 1. 한 과목만 수강 신청한 학생 조회하기
SELECT stu_no
  FROM enroll_t
 GROUP BY stu_no
HAVING COUNT(*) = 1;

-- 2. 아무도 신청하지 않은 과목 조회하기
SELECT subj_no
  FROM enroll_t
 GROUP BY subj_no
HAVING COUNT(*) = 0;
