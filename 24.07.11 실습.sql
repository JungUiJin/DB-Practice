-- 1. 모든 사원 모든 컬럼 조회
SELECT * FROM employee;
  
-- 2. 사원들의 사번(사원번호), 이름 조회

SELECT 
		 EMP_ID
	  , EMP_NAME
  FROM employee; 
-- 3. 201번 사번의 사번 및 이름 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
  FROM employee
 WHERE EMP_ID = 201; 

-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , DEPT_CODE
  FROM employee
 WHERE DEPT_CODE = 'D9'; 
 
-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , JOB_CODE
  FROM employee
 WHERE JOB_CODE = 'J1'; 
 
 
-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , DEPT_CODE
	  , SALARY
  FROM employee
 WHERE SALARY > 3000000; 
 
-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회
SELECT
	    EMP_NAME
	  , DEPT_CODE
	  , SALARY
  FROM employee
 WHERE DEPT_CODE = 'D6'
 	AND SALARY > 3000000; 

-- 8. 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , SALARY
	  , BONUS
  FROM employee
 WHERE BONUS IS NULL; 
 
-- 9. 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , DEPT_CODE
  FROM employee
 WHERE DEPT_CODE != 'D9'; 

-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)
SELECT 
		 EMP_ID AS '사번'
	  , EMP_NAME AS '이름'
	  , HIRE_DATE AS '입사일'
  FROM employee
 WHERE ENT_YN = 'N'; 

-- 11. employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기
SELECT 
		 EMP_ID AS '사번'
	  , EMP_NAME AS '이름'
	  , SALARY AS '급여'
	  , DEPT_CODE AS '부서코드'
	  , JOB_CODE AS '직급코드'
  FROM employee
 WHERE SALARY BETWEEN 3500000 AND 5500000 ; 
 
-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , HIRE_DATE
  FROM employee
 WHERE EMP_NAME LIKE "김%"; 

-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
SELECT 
		 EMP_ID
	  , EMP_NAME
	  , HIRE_DATE
  FROM employee
 WHERE EMP_NAME NOT LIKE "김%"; 

-- 14. EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회
SELECT 
		 EMP_NAME
	  , EMP_NO
	  , DEPT_CODE
  FROM employee
 WHERE EMP_NAME LIKE "%하%"; 
 
-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회
SELECT 
		 EMP_NAME
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE JOB_CODE = "J2" AND SALARY > 2000000
	 OR JOB_CODE = "J7"; 
 
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회
SELECT 
		 EMP_NAME
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE (JOB_CODE = "J2"
	 OR JOB_CODE = "J7" ) AND SALARY > 2000000; 
 

-- 17. IN 연산자로 업그레이드
​SELECT 
		 EMP_NAME
	  , SALARY
	  , JOB_CODE
  FROM employee
 WHERE SALARY > 2000000  
   AND JOB_CODE IN ('J2','J7');
 	 
