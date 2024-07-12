-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1행)
SELECT
		 a.EMP_ID
	  , a.EMP_NAME
	  , b.DEPT_TITLE
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  WHERE a.EMP_NAME LIKE "%형%";

-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9행)
SELECT
		 a.EMP_NAME
	  , b.DEPT_TITLE
	  , a.DEPT_CODE
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  WHERE b.DEPT_TITLE LIKE "%해외영업%";

-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8행)(INNER JOIN 결과)
SELECT
		 a.EMP_NAME
	  , a.BONUS
	  , b.DEPT_TITLE
	  , c.LOCAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
 WHERE a.BONUS IS NOT NULL;

-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3행)
SELECT
		 a.EMP_NAME
	  , b.JOB_NAME
	  , c.DEPT_TITLE
	  , d.LOCAL_NAME
  FROM employee a
  JOIN job b ON a.JOB_CODE = b.JOB_CODE
  JOIN department c ON a.DEPT_CODE = c.DEPT_ID
  JOIN location d ON c.LOCATION_ID = d.LOCAL_CODE
 WHERE a.DEPT_CODE = 'D2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20행)
SELECT
		 a.EMP_NAME
	  , b.JOB_NAME
	  , a.SALARY
	  , a.SALARY*(1+NVL(a.bonus,0))*12 AS 연봉
  FROM employee a
  JOIN job b ON a.JOB_CODE = b.JOB_CODE
  left JOIN sal_grade c ON a.SAL_LEVEL = c.SAL_LEVEL
  WHERE a.SALARY > c.MIN_SAL;
 
-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15행)
SELECT
		 a.EMP_NAME
	  , b.DEPT_TITLE
	  , c.LOCAL_NAME
	  , d.NATIONAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
  JOIN national d ON c.NATIONAL_CODE = d.NATIONAL_CODE
  WHERE d.NATIONAL_CODE = "KO" OR d.NATIONAL_CODE = "JP";
  

-- 7. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8행)
SELECT
		 a.EMP_NAME
	  , b.JOB_NAME
	  , a.SALARY
  FROM employee a
  JOIN job b ON a.JOB_CODE = b.JOB_CODE
 WHERE a.JOB_CODE = "J4" OR a.JOB_CODE = "J7"
 ORDER BY b.JOB_NAME;
  

-- 8. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회(2행)
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)

SELECT
		 a.EMP_ID
	  , a.EMP_NAME
	  , c.JOB_NAME
	  , b.DEPT_TITLE
	  , d.LOCAL_NAME
  FROM employee a
  JOIN department b ON a.DEPT_CODE = b.DEPT_ID
  JOIN job c ON a.JOB_CODE = c.JOB_CODE
  JOIN location d ON b.LOCATION_ID = d.LOCAL_CODE 
 WHERE c.JOB_NAME = "대리" and d.LOCAL_NAME IN ("ASIA1", "ASIA2", "ASIA3");
