-- 계정생성

-- swcamp라는 이름으로 계정 생성
CREATE USER 'swcamp'@'%' identified BY 'swcamp';
-- 데이터베이스(스키마) 생성
CREATE DATABASE menudb;
-- 현재 존재하는 데이터베이스 목록 확인
SHOW DATABASES;

-- swcamp의 주어진 권한 확인
SHOW GRANTs FOR 'swcamp'@'%';
-- menudb를 다룰 수 있는 권한을 swcamp 계정에 부여
GRANT ALL PRIVILEGES ON menudb.*TO 'swcamp'@'%';
-- 세션 관리자에서 swcamp로 접속 한 뒤 사용할 데이터베이스 선택
USE menudb;
