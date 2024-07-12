-- (5). join연산 : 2개 이상의 테이블을 관련 있는 컬럼을 통해 결합.
USE menudb
-- join의 종류

-- 1. INNER JOIN: 두 테이블의 교집합을 반환. (기본)
-- (1). On : 교집합 이름이 서로 다를 때.
SELECT
       a.menu_name
     , b.category_name
  FROM tbl_menu a
  JOIN tbl_category b USING a.category_code = b.category_code;
-- (2). USING : 교집합 이름이 서로 같을 때.
SELECT
       a.menu_name
     , b.category_name
  FROM tbl_menu a
  JOIN tbl_category b USING b USING (category_code);
-- employeedb의 employee와 department join
USE employeedb;
SELECT
		 a.emp_name
	  , b.dept_title
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID;

-- 2. LEFT JOIN: 첫 번째 테이블의 모든 레코드롸 두 번째 테이블에서 일치하는 레코드를 반환
-- >> 일치값이 없어도 포함시킬 때.
SELECT
		 a.emp_name
	  , b.dept_title
  FROM employee a
  LEFT JOIN department b ON a.DEPT_CODE = b.DEPT_ID;


-- 3. RIGHT JOIN : 두 번째 테이블의 모든 레코드와 첫 번째 체이블에서 일치하는 레코드를 반환
SELECT
		 a.emp_name
	  , b.dept_title
  FROM employee a
  RIGHT JOIN department b ON a.DEPT_CODE = b.DEPT_ID;

-- 4. CROSS JOIN : 두 테이블의 가능한 모든 조합을 반환
SELECT
		 a.menu_name
	  , b.category_name
  FROM tbl_menu a
  CROSS JOIN tbl_category b;
  
-- 5. SELF JOIN
SELECT
		 a.category_name 소분류
	  , b.category_name 대분류
  FROM tbl_category a
  JOIN tbl_category b ON a.category_code = b.ref_category_code;

SELECT
		 a.EMP_NAME 사원
	  , b.EMP_NAME 매니저
  FROM employee a
  left JOIN employee b ON a.MANAGER_ID = b.EMP_ID;

-- 다중 조인
-- 사원명, 부서명, 직급명 조회
SELECT
		 a.EMP_NAME 사원명
	  , b.DEPT_TITLE 부서명
	  , c.JOB_NAME 직급명
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN job c ON a.JOB_CODE = c.JOB_CODE;

-- 사원명, 지역명, 국가명 조회
SELECT
		 a.EMP_NAME 사원명
	  , c.LOCAL_NAME 지역명
	  , d.NATIONAL_NAME 국가명
  FROM employee a
  JOIN department b ON  a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
  JOIN NATIONAl d ON c.NATIONAL_CODE = d.NATIONAL_CODE ;
