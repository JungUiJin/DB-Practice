-- 04. limit : select문의 결과 집합에서 반환할 행의 갯수 제한
SELECT
		 menu_code
	  , menu_name
	  , menu_price
  FROM tbl_menu
 ORDER BY menu_price desc
 -- [offset] : 시작할 행의 번호(인덱스), [row_count]: 이후 행 부터 반환할 개수
 LIMIT 1,4; -- 2번행부터 4개 