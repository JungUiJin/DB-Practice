-- 03. where : 특정 조건에 맞는 레코드만을 선택
SELECT
		 menu_code
	  , menu_name
  FROM tbl_menu
 WHERE orderable_status = 'Y';
-- 메뉴 가격이 13000원인 메뉴
SELECT
	    menu_name
	  , menu_price
  FROM tbl_menu
 WHERE menu_price = 13000;
 
 -- 같지 않다 (!=, <>)
SELECT
	    menu_name
	  , menu_price
  FROM tbl_menu
 WHERE menu_price <> 13000;

-- 대소비교 (<, >, <=, >=)
SELECT
	    menu_name
	  , menu_price
  FROM tbl_menu
 WHERE menu_price >= 13000;
 
 -- 논리연산자
 
 -- (1) AND연산: 둘 다 참일 때 참
 
 -- 판매가능이고 카테고리 코드가 10
SELECT
	    menu_code
	  , menu_name
	  , category_code
	  , orderable_status
  FROM tbl_menu
 WHERE orderable_status = 'Y'
 	AND category_code = 10;
 
-- (2) OR연산: 둘 중 하나가 참일 때 참

-- 가격이 5000원 이상이거나 카테고리 코드가 10
SELECT
		 menu_name
	  , menu_price
	  , category_code
  FROM tbl_menu
 WHERE menu_price > 5000
 	 OR category_code = 10
 	 
-- and가 or보다 우선순위가 높다.

-- (3) between 연산자, not 사용
SELECT
		 menu_name
	  , menu_price
	  , category_code
  FROM tbl_menu
 WHERE menu_price NOT BETWEEN 10000 AND 25000
 ORDER BY menu_price;
 
-- (4). like 연산자
SELECT
		 menu_code
	  , menu_name
  FROM tbl_menu
 WHERE menu_name LIKE '%마늘%';	 
 
SELECT
		 menu_name
	  , menu_price
	  , category_code
  FROM tbl_menu
 WHERE menu_price >= 5000
 	AND category_code = 10
 	AND menu_name LIKE '%갈치%'; 
--  '_'는 빈칸을 의미함. '_'를 포함하는 문자열을 찾고 싶다면 앞에 \(역슬래시) 붙이기

-- (5). IN 연산자
SELECT
		 menu_code
	  , category_code
  FROM tbl_menu
 WHERE category_code IN (4, 5, 6)
 ORDER BY category_code;

-- (6). is null : null값 비교
SELECT
		 category_code
	  , category_name
	  , ref_category_code
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;	 

-- (7). distinct: 중복 컬럼 값 제거하고 조회
SELECT
		 distinct category_code
  FROM tbl_category
 ORDER BY category_code;

SELECT
		 distinct ref_category_code
  FROM tbl_category
 ORDER BY 1; -- 컬럼 순번
-- distinct는 select절 맨 앞쪽에 한 번만 작성한다.
SELECT
		 distinct category_code
	  , orderable_status
  FROM tbl_menu
 ORDER BY 1;

