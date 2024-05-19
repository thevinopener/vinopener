![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=180&section=header&text=VINOPENER&fontSize=32&animation=fadeIn&fontAlignY=36&fontColor=000000)

<h2 align="center">
차별성은 남다름이 아닌 나다움에서 온다. 관심이 취미가 되는 단, 하나의 서비스
</h2>
<p align="center">
<!-- <a href="https://ssafy.coffee">Visit Our Site</a> -->
</p>

## 개발 기간
| 2024.04.08 ~ 2024.05.20 (6주) |
| ----------------------------- |

## 개요

### **"OpenAI Assistant, Spring Batch, OCR을 적용한 사용자 맞춤형 종합 와인 플랫폼"**

VINOPENER는 와인에 관심이 있는 초심자부터 와인을 즐기는 상급자까지 사용가능한 활용도 높은 종합 와인 플랫폼입니다.

주요기능은 아래와 같습니다.

1. **OpenAI Assistant**와 상호작용하며 테이스팅 노트 작성

2. **Google ML Kit Recognition** 기반 **OCR**을 통해 와인 검색

3. **Cosine Similarity** 적용 및 **Spring Batch**를 통해 사용자 맞춤형 와인 추천

상기기능 및 기타 기능들과 더불어 사용자 편의성과 실용성을 염두에 두고 뛰어난 UI/UX를 위해 수차례 QA를 거친 사용성 높은 서비스입니다.
또한, 와인을 접하는 사람들이 보다 쉽게 관련 정보를 습득하고 소통하며 와인에 대해 알아갈 수 있도록 개발했습니다.


## 팀 소개

| 팀원     | 역할     |
| -------- | -------- |
| 😈양희승 | 팀장, FE |
| 👶고영훈 | BE, INFRA |
| 😁박희찬 | BE       |
| 😘전원빈 | FE, AI   |
| 😄최지웅 | FE, DATA |
| 👦한정수 | BE,AIv   |

## 🔨 기술 스택 🔨

**Backend**

![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=spring%20boot&logoColor=white)
![Spring Security](https://img.shields.io/badge/spring%20security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)
![Spring Batch]()
![Redis]()
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white)

**Frontend**
![Flutter]

**Database**

![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

**Deploy**

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![Amazon S3](https://img.shields.io/badge/amazon--s3-%23569A31.svg?style=for-the-badge&logo=amazon-s3&logoColor=white)

**Collaboration**

![GitLab](https://img.shields.io/badge/gitlab-%23181717.svg?style=for-the-badge&logo=gitlab&logoColor=white)
![Jira](https://img.shields.io/badge/jira-%230A0FFF.svg?style=for-the-badge&logo=jira&logoColor=white)
![MatterMost](https://img.shields.io/badge/mattermost-0058CC.svg?style=for-the-badge&logo=mattermost&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)

---

# 파일 구조

## FRONTEND

```ini
frontend

```

## BAKEND
```ini
backend

```

</details>

# 시스템 아키텍처

![시스템아키텍처](/uploads/67812a05b6a8887d9662501f4db328f0/System_Architecture.png)

# ERD

![ERD](/uploads/9a2ecd9e6644bdb2e818e294020073a9/ERD.png)


# 화면 정의서

## WireFrame

### 전체 와이어 프레임

![전체 와이어 프레임](/uploads/f817e803299a2d8836bb3bc8bec7a7f6/WireFrame.png)


---
# 사용자 화면
## 로그인

![로그인]()

![로그인_온보딩_샘플](/uploads/84e1e7d5909bf0132562501667000b40/로그인_온보딩_샘플.gif)

![설문조사]()

---

## 추천

![메인화면]

---

## 검색

![타입별검색]()

![국가별검색]()

![문자검색]()

![검색기록]()

![검색결과]()

![상세조회]()

![사진검색]()

---

## 피드

![피드목록]()

![피드작성]()

![피드공유]()

---

## 테이스팅 노트

![노트목록]()

![노트작성 1단계]()

![노트작성 2단계]()

![노트작성 3단계]()

![노트작성 4단계]()

![음성노트작성 1단계]()

![음성노트작성 2단계]()

![음성노트작성 3단계]()

![음성노트작성 4단계]()

---

## 마이페이지

![피드]()

![피드삭제]()

![즐겨찾기]()

![셀러]()

![로그아웃]()

---


## 서비스 소개 (주요 기능)

### 1. 사용자

- 로그인

  - 소셜 로그인(Google) / 로그아웃
  - OnBoarding 서비스 소개
  - 설문조사 작성

- 추천

  - 취향설문조사 기반
  - 테이스팅 노트 작성 기반
  - 셀러 추가 항목 기반
  - 전체 조회수 순
  - 와인 평점 순

- 검색

  - 와인타입별 검색
  - 제조국가별 검색
  - 와인 텍스트 검색
  - 와인 사진 검색
  - 과거 검색기록
  - 검색기록 전체삭제
  - 검색기록 단일삭제

- 피드

  - 

- 테이스팅노트
  - 

- 마이페이지
  - 



# 컨벤션

### Branch

```javascript
- 주요 브랜치 (항상 유지)
    - **master**
        - 항상 배포 가능한 브랜치 (백업)

    - **develop**
        - 배포 브랜치(main)의 다음 버전을 준비하는 브랜치
        - 개발된 모든 코드의 통합 장소
- 보조 브랜치 (임시 생성/머지했으면 삭제)
    - **feature**
        - 특정 기능을 개발하는 브랜치
        - develop 브랜치에서 생성, 기능 개발 후 develop 브랜치로 병합
        - e.g. `feature/be/login`, `feature/fe/logou`

    - **hotfix**
        - 배포 브랜치의 현재 버전에서 버그가 생겼을 때 긴급 수정을 위한 브랜치
        - main 브랜치에서 생성, 버그 수정 후 main 및 develop 브랜치로 병합
        - e.g. `hotfix/20240111`, `hotfix/#5`
```

### Commit

- 커밋 메시지 구조
  - 개행 2번씩.

```text
type: <subject>

[body]

[footer]
```

- type

```javascript
- feat: 기능 추가
- fix: 버그 수정
- refactor: 코드 리팩토링
- design: CSS 등 디자인
- style: 코드 스타일 수정
- test: 코드 테스트 관련
- docs: 문서 수정
- chore: 빌드 등 기타 변경사항
- rename: 파일명 수정
- remove: 파일 삭제
```

- subject

```javascript
1. 최대 50글자까지 작성
2. 특수기호 사용 금지 (마침표 등)
3. 영문 작성시 첫 단어 명령문, 첫 글자 대문자
    - e.g. `Add file`
4. 한글 작성시 개조식으로 작성
    - e.g. `파일 추가`
```

- body

```javascript
1. 생략 가능
2. '어떻게'보다는 '무엇을', '왜' 변경했는지 작성
```

- footer

```python
1. 생략 가능
2. GitLab 연동
3. Fixes #<이슈번호>
4. Resolves #<이슈번호>
5. Ref #<이슈번호>
6. Related to #<이슈번호>
7. e.g. `Fixes: #47`, `Related to: #32, 21`
```

# DATA

-네이버 영화 리뷰 : https://github.com/e9t/nsmc<br/>
-네이버쇼핑, Steam 플랫폼 리뷰 데이터 : https://github.com/bab2min/corpus<br/>
-한국어 단발성 대화 데이터셋 : https://aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100<br/>
-감성 대화 말뭉치 : https://aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=86<br/>
