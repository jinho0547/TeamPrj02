# TeamPrj02
2번째 팀 프로젝트


주변 친구들과 취미를 공유할 수 있는 동아리 생성 및 모임 생성
네이버 카페와 비슷

내가 맡은 부분

※동아리 CRUD(글 작성, 상세보기, 수정, 삭제) 게시판
-글 목록 페이지
/ 해당 동아리에 해당하는 글들을 표시해준다. 페이지당 15개의 글을 목록으로 보여주며 총 게시글 수, 페이지 수도 함께 표시된다.
/ 목록에 출력 된 글 중 댓글을 포함한 글이 있을 경우 글 제목 옆에 댓글 수를 표시해준다.
/ 게시글 검색의 경우 제목과 작성자를 기준으로 검색할 수 있으며, 검색결과의 게시글 수와 페이지도 변경되도록 구현하였다.
상세보기 페이지
/ jQuery Ajax를 이용한 Rest방식 댓글 구현
/ 해당 페이지 로딩 시 해당 글의 댓글을 로드해온다
/ 댓글 작성 시 Ajax를 통한 작성 및 새로운 목록 불러오기
/ 해당 페이지에서 이동 없이 수정,삭제 가능
작성, 수정 페이지
/ 같은 폼을 사용하지만 수정 페이지 경우 해당 글의 수정 전 내용을 표시 후 수정할 수 있도록 해준다.


※동아리 내 메뉴
/ 등급에 따라 메뉴의 접근할 수 있는 내용을 다르게 함.
/ 해당 세션에 저장된 아이디를 불러와 닉네임을 표시하는 작업
