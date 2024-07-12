-- 07. subqueries 
-- : 다른 쿼리 내에서(메인쿼리) 실행되는 쿼리

-- 서브쿼리
SELECT
		 category_code
  FROM tbl_menu
 WHERE menu_name = "민트미역국";

-- 메인쿼리
SELECT
		 menu_name
  FROM tbl_menu
 WHERE category_code = 4;

-- 메인쿼리 내에서 서브쿼리 작성
SELECT
		 menu_name
  FROM tbl_menu
 WHERE category_code = (SELECT
										 category_code
								  FROM tbl_menu
								 WHERE menu_name = "민트미역국");

-- 서브쿼리를 활용한 메인 쿼리
SELECT 
		 MAX(COUNT)
  FROM (SELECT COUNT(*) AS 'COUNT'
  		    FROM tbl_menu
  		   GROUP BY category_code) AS countmenu;

-- 상관 서브쿼리 : 메인 쿼리가 서브 쿼리의 결과에 영향을 주는 형태
SELECT
		 menu_code
	  , menu_name
	  , menu_price
	  , category_code
	  , orderable_status
  FROM tbl_menu a
  WHERE menu_price > (SELECT AVG(menu_price)
  							   FROM tbl_menu
  							  WHERE category_code = a.category_code);

-- exists : 조회 결과가 있을 때 ture 없을 때 false
SELECT
		 category_name
  FROM tbl_category a
  WHERE EXISTS (SELECT 1
  						FROM tbl_menu b
  					  WHERE b.category_code = a.category_code);

-- CTE(Common Table Expression)
-- 인라인 뷰로 쓰이는 서브쿼리를 미리 정의해서 사용
WITH menucate AS(
	SELECT menu_name
		  , category_name
	  FROM tbl_menu a
	  JOIN tbl_category b ON a.category_code = b.category_code
)



