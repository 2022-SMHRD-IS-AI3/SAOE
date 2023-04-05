# VeriView
---

## 1. 프로젝트 개요 <br/>
프로젝트 제목 : VeriView <br/>
프로젝트 주제 : 리뷰 기반 평가 SNS <br/>
목적 : SNS_Reverse Engineering <br/>
용도 : <br/>
개발 기간 : 23.03.22 - 23.04.03 <br/>
#### 팀소개
-팀장<br/>
  안운암 : 총괄, 데이터베이스, 데이터 수집 및 분석<br/>
-팀원<br/>
  심우석 : 백엔드<br/>
  오소아 : 프론트엔드 UI<br/>
  이동수 : 프론트엔드, 데이터 분석<br/>


#### 프로젝트 소개

## 2. 시작 가이드

#### 이클립스 기준
- 팀장 초기 프로젝트 생성 후 Push 하는법
  1. 프로젝트 생성
  2. 프로젝트 우클릭 - Team메뉴 Share Project
  3. 깃허브 서버에서 접근할 로컬 repository 경로 설정 => 프로젝트명에 [repository matser]가 생김
  4. 프로젝트 우클릭 - Team메뉴 Commit - 하단 탭에 Git Staging 탭 생김
  5. Unstaged/Staged Changes -> 변경된 파일을 올릴건지? / 전부올릴거면 + 두개 아이콘 클릭 -> f5
  6. Commit Message : 안내문구 작성
  7. Commit and Push / Commit 중 어떤 걸 할건지 -> 이번 프로젝트는 Commit으로 결정 -> f5
    왜 Commit?? -> 기존의 파일과 연동되는지 확인하기 위해서
  8. Local Repository에 현재 프로젝트가 반영됨
  9. 프로젝트 우클릭 - Team메뉴 Push Branch 'master' 클릭 => 어디에 올릴건지 설정
  10. Location - URI부분에 원격저장소 주소 / Authentication(User:이메일주소, Password:토큰값) 삽입
  11. Prieview - Push - 안내문구 출력

- Local Repository 삭제 하는 법
  1. 상단 탭 Window - Show View - Other - Git Repositories
  2. 하단탭 - 해당 repository 우클릭 - Delete repository - 체크박스 전부 클릭 - Delete


- 프로젝트를 내려받는(Clone)법
  1. 빈 곳 우클릭 - Import 두번 - Projects from Git - Clone URI
  2. URI(팀Repository주소), User(git 이메일), Password(토큰값  입력, 공백주의) 입력
  3. Next2번 - Local Destination에서 경로 설정 - Next 2번 - Finish
  4. 프로젝트 추가 됨 (프로젝트명[팀명])

- 작성한거 Push 하는법
  1. 작성한 거 저장 - 프로젝트 우클릭 - Team - Commit - Git Staging 창이 뜸
  2. 바뀐 파일 올리려면 UnStaged에서 Staged로 옮김 / 모두 옮기려면 +두개있는 아이콘 클릭 후 f5
  3. Commit Message에 안내문구 작성 - 아래의 Commit 클릭 후 f5
  4. 프로젝트 우클릭 - Team - Push Branch Master

## 3. 기술 스택
- 개발환경 : 이클립스, VSCode, SQLDeveloper<br/>
- 개발언어 : Java, HTML, CSS, JavaScript, Oracle DB<br/>
- 협업툴 : 카카오톡, 구글 문서, 전자문서<br/>

## 4. 화면 구성
![image](https://user-images.githubusercontent.com/93226595/230020951-ed1a22fb-df95-429e-ada9-171a4db01bc1.png)

화면 설계서<br/>
https://docs.google.com/presentation/d/1BdNGxdfCfmNC5gawmQX8hEJy8JVKiHA-dg7CVzO0aoY/edit#slide=id.p1

## 5. 주요 기능
  1. 글 작성, 사진 업로드
  2. 검색
  3. 공감 + 댓글
  4. 팔로우, 공유, 스크랩
  5. 리뷰 검증 알고리즘
  6. 리뷰어 
