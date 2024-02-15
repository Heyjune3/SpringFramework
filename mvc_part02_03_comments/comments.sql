show tables;

DESCRIBE tbl_board;

SELECT * FROM tbl_board ORDER BY bno DESC;

-- 1번 게시글 없을 시 sample data 추가
INSERT INTO tbl_board(bno,title,content,writer)
VALUES(1,'제목-test','내용-test','원빈');
INSERT INTO tbl_board(bno,title,content,writer)
VALUES(2,'제목-test2','내용-test2','강동원');
INSERT INTO tbl_board(bno,title,content,writer)
VALUES(3,'제목-test3','내용-test3','장동건');

-- tbl_board 게시물에 등록된 댓글을 저장할 테이블
CREATE TABLE IF NOT EXISTS tbl_comment(
	cno INT PRIMARY KEY AUTO_INCREMENT,			-- 댓글 번호
	bno INT NOT NULL,							-- 댓글이 작성된 게시글 번호
	content TEXT NOT NULL,						-- 작성 내용
	author VARCHAR(50) NOT NULL,				-- 작성자
	regdate TIMESTAMP NOT NULL DEFAULT now(),	-- 작성 시간
	updatedate TIMESTAMP NOT NULL DEFAULT now(),-- 수정시간
	-- tbl_board에 bno로만 값 추가
	CONSTRAINT fk_tbl_bno FOREIGN KEY(bno) 
	REFERENCES tbl_board(bno) ON DELETE CASCADE,
	-- 자주 이루어지는 검색되는 특정 컬럼을 INDEX에 추가해 정렬시켜서 검색속도를 빠르게 만듬 (단, INDEX는 남발하면 속도가 더 느려짐) 
	INDEX(bno)
);

-- 인덱스 정보 확인
SHOW INDEXES FROM tbl_comment;

-- 1번 게시글에 등록된 댓글 목록
SELECT * FROM tbl_comment WHERE bno = 1;

-- 제약 조건 정보 확인
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'develop_spring' AND TABLE_NAME = 'tbl_comment';

-- 댓글 삽입
INSERT INTO tbl_comment(bno,content,author)
VALUES(1,'1번 게시글의 댓글','이준호');
INSERT INTO tbl_comment(bno,content,author)
VALUES(1,'1번 게시글의 2번째 댓글','신은철');

INSERT INTO tbl_comment(bno,content,author)
VALUES(2,'2번 게시글의 댓글','이준호');
INSERT INTO tbl_comment(bno,content,author)
VALUES(2,'2번 게시글의 2번째 댓글','신은철');

SELECT * FROM tbl_comment;

SELECT * FROM tbl_comment WHERE bno = 1;

-- 댓글이 달린 게시글 삭제 시 오류 == 외래키 제약 조건에 걸림
-- DELETE FROM tbl_board WHERE bno = 1;

-- 댓글까지 삭제 시켜줘야 삭제할 수 있음 == tbl_board 테이블도 영향을 받아버림
DELETE FROM tbl_comment WHERE bno = 1;
DELETE FROM tbl_board WHERE bno = 1;

-- 한번에 삭제 시키는 방법 : fk_tbl_bno 제약조건을 먼저 drop
ALTER TABLE tbl_comment DROP CONSTRAINT fk_tbl_bno;

-- CASCADE == 부모 테이블(board) 정보가 수정 또는 삭제 시 참조하고 있는 행(comment) 정보도 같이 적용
-- CASCADE 가 추가된 외래키 제약 조건 추가
ALTER TABLE tbl_comment ADD CONSTRAINT fk_tbl_bno FOREIGN KEY(bno)
REFERENCES tbl_board(bno) ON DELETE CASCADE;

-- 제약 조건 정보 확인
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'develop_spring' AND TABLE_NAME = 'tbl_comment';

-- 이제 같이 삭제됨
DELETE FROM tbl_board WHERE bno = 1;

SELECT * FROM tbl_comment 
WHERE bno = 2 
ORDER BY cno DESC
-- limit startRow, perPageNum;
limit 0, 10;







