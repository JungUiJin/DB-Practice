-- 01. select : 특정 테이블에서 원하는 데이터를 조회해서 가져오는 구문
-- 테이블에 있는 모든 내용 출력
SELECT * FROM tbl_menu;
-- 테이블에 특정 컬럼을 설정하여 출력
SELECT 
		  menu_name
		, menu_price
		, category_code
  FROM tbl_menu;
-- SELECT문 단독 사용 가능(from 없이)
SELECT 7 + 3;
SELECT 7 * 3;
SELECT 7 % 3;
-- 내장 함수 사용 가능
SELECT NOW(); -- 현재 시간
SELECT CONCAT('홍',' ', '길동'); -- 문자열 연결
