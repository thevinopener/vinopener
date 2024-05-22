![header](https://capsule-render.vercel.app/api?type=waving&color=gradient&height=180&section=header&text=🍷%20VINOPENER&fontSize=32&animation=fadeIn&fontAlignY=36&fontColor=ffffff)

<h2 align="center">
차별성은 남다름이 아닌 나다움에서 온다. 관심이 취미가 되는 단, 하나의 서비스
</h2>
<br>
<p align="center">
<b><a href="https://vinopener.netlify.app/">Download Our App</a></b>
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
| 😁박희찬 | BE, DATA |
| 😘전원빈 | FE, AI   |
| 😄최지웅 | FE, DATA |
| 👦한정수 | BE,AI   |

## 🔨 기술 스택 🔨

**Backend**

![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=spring%20boot&logoColor=white)
![Spring Security](https://img.shields.io/badge/spring%20security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)
![redis](https://img.shields.io/badge/redis-DC382D.svg?style=for-the-badge&logo=redis&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white)

**Frontend**

![Flutter](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

**Database**

![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white)

**Deploy**

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)
![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![openai](https://img.shields.io/badge/openai-412991.svg?style=for-the-badge&logo=openai&logoColor=white)
![Amazon S3](https://img.shields.io/badge/amazon--s3-%23569A31.svg?style=for-the-badge&logo=amazon-s3&logoColor=white)

**Collaboration**

![GitLab](https://img.shields.io/badge/gitlab-%23181717.svg?style=for-the-badge&logo=gitlab&logoColor=white)
![Jira](https://img.shields.io/badge/jira-%230A0FFF.svg?style=for-the-badge&logo=jira&logoColor=white)
![MatterMost](https://img.shields.io/badge/mattermost-0058CC.svg?style=for-the-badge&logo=mattermost&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)

---

# 파일 구조

<details>
<summary>
<b>Frontend</b>
</summary>

```log
frontend
 ┣ .dart_tool
 ┣ .idea
 ┣ android
 ┃ ┣ .gradle
 ┃ ┣ app
 ┃ ┃ ┣ src
 ┃ ┃ ┃ ┣ debug
 ┃ ┃ ┃ ┣ main
 ┃ ┃ ┃ ┃ ┣ java
 ┃ ┃ ┃ ┃ ┣ kotlin
 ┃ ┃ ┃ ┃ ┣ res
 ┃ ┃ ┃ ┃ ┃ ┣ drawable
 ┃ ┃ ┃ ┗ profile
 ┃ ┣ gradle
 ┣ assets
 ┃ ┗ images
 ┃ ┃ ┣ aroma
 ┣ build
 ┃ ┃ ┃ ┣ assets
 ┃ ┃ ┃ ┃ ┗ debug
 ┃ ┃ ┃ ┃ ┃ ┣ flutter_assets
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ assets
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ images
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ aroma
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ flag
 ┣ lib
 ┃ ┣ constants
 ┃ ┃ ┣ colors.dart
 ┃ ┃ ┣ fonts.dart
 ┃ ┃ ┣ icon.dart
 ┃ ┃ ┣ wine_label.dart
 ┃ ┃ ┗ wine_type.dart
 ┃ ┣ models
 ┃ ┃ ┣ bookmark
 ┃ ┃ ┃ ┗ bookmark.dart
 ┃ ┃ ┣ cellar
 ┃ ┃ ┃ ┗ cellar.dart
 ┃ ┃ ┣ feed
 ┃ ┃ ┃ ┗ feed_post_requests.dart
 ┃ ┃ ┣ recommend
 ┃ ┃ ┃ ┗ recommend_wine_list.dart
 ┃ ┃ ┣ search
 ┃ ┃ ┃ ┣ search_bookmark_status.dart
 ┃ ┃ ┃ ┣ search_cellar_status.dart
 ┃ ┃ ┃ ┣ search_history.dart
 ┃ ┃ ┃ ┣ search_wine_detail.dart
 ┃ ┃ ┃ ┣ search_wine_name_result.dart
 ┃ ┃ ┃ ┣ search_wine_nation_result.dart
 ┃ ┃ ┃ ┗ search_wine_type_result.dart
 ┃ ┃ ┣ user
 ┃ ┃ ┃ ┗ user_info.dart
 ┃ ┃ ┣ ai_chat_model.dart
 ┃ ┃ ┣ feed.dart
 ┃ ┃ ┣ note_model.dart
 ┃ ┃ ┣ survey_model.dart
 ┃ ┃ ┣ taste.dart
 ┃ ┃ ┣ token.dart
 ┃ ┃ ┣ user.dart
 ┃ ┃ ┗ wine_model.dart
 ┃ ┣ providers
 ┃ ┃ ┣ feed
 ┃ ┃ ┃ ┣ feed_tab_state_provider.dart
 ┃ ┃ ┃ ┗ new_feed_wine_list_provider.dart
 ┃ ┃ ┣ mypage
 ┃ ┃ ┃ ┣ my_bookmark_provider.dart
 ┃ ┃ ┃ ┣ my_cellar_provider.dart
 ┃ ┃ ┃ ┗ my_feed_provider.dart
 ┃ ┃ ┣ note
 ┃ ┃ ┃ ┗ note_wine_provider.dart
 ┃ ┃ ┣ search
 ┃ ┃ ┃ ┣ search_history_provider.dart
 ┃ ┃ ┃ ┣ search_wine_detail_provider.dart
 ┃ ┃ ┃ ┗ search_wine_list_provider.dart
 ┃ ┃ ┣ bottombar_provider.dart
 ┃ ┃ ┣ recommend_provider.dart
 ┃ ┃ ┗ user_provider.dart
 ┃ ┣ screens
 ┃ ┃ ┣ feed
 ┃ ┃ ┃ ┣ feed_content_screen.dart
 ┃ ┃ ┃ ┣ feed_detail_screen.dart
 ┃ ┃ ┃ ┣ feed_img_screen.dart
 ┃ ┃ ┃ ┣ feed_screen.dart
 ┃ ┃ ┃ ┗ feed_wine_search_screen.dart
 ┃ ┃ ┣ mypage
 ┃ ┃ ┃ ┣ mypage_cover_screen.dart
 ┃ ┃ ┃ ┣ mypage_screen.dart
 ┃ ┃ ┃ ┣ mypage_setting_screen.dart
 ┃ ┃ ┃ ┗ mypage_survey_screen.dart
 ┃ ┃ ┣ note
 ┃ ┃ ┃ ┣ note_ai_screen.dart
 ┃ ┃ ┃ ┣ note_color_screen.dart
 ┃ ┃ ┃ ┣ note_list_screen.dart
 ┃ ┃ ┃ ┣ note_opinion_screen.dart
 ┃ ┃ ┃ ┣ note_result_screen.dart
 ┃ ┃ ┃ ┣ note_screen.dart
 ┃ ┃ ┃ ┣ note_search_result_screen.dart
 ┃ ┃ ┃ ┣ note_search_screen.dart
 ┃ ┃ ┃ ┣ note_smell_screen.dart
 ┃ ┃ ┃ ┗ note_taste_screen.dart
 ┃ ┃ ┣ recommend
 ┃ ┃ ┃ ┗ recommend_screen.dart
 ┃ ┃ ┣ search
 ┃ ┃ ┃ ┣ search_camera_bottom_screen.dart
 ┃ ┃ ┃ ┣ search_chat_screen.dart
 ┃ ┃ ┃ ┣ search_detail_screen.dart
 ┃ ┃ ┃ ┣ search_main_camera_screen.dart
 ┃ ┃ ┃ ┣ search_result_screen.dart
 ┃ ┃ ┃ ┣ search_second_camera_screen.dart
 ┃ ┃ ┃ ┗ search_text_screen.dart
 ┃ ┃ ┣ wine
 ┃ ┃ ┃ ┣ country_search_screen.dart
 ┃ ┃ ┃ ┣ type_search_screen.dart
 ┃ ┃ ┃ ┗ wine_search_screen.dart
 ┃ ┃ ┣ architecture_example.dart
 ┃ ┃ ┣ home_screen.dart
 ┃ ┃ ┣ introduce_screen.dart
 ┃ ┃ ┣ intro_screen.dart
 ┃ ┃ ┣ login_screen.dart
 ┃ ┃ ┗ survey_screen.dart
 ┃ ┣ services
 ┃ ┃ ┣ bookmark_service.dart
 ┃ ┃ ┣ cellar_service.dart
 ┃ ┃ ┣ feed_service.dart
 ┃ ┃ ┣ note_service.dart
 ┃ ┃ ┣ recommend_service.dart
 ┃ ┃ ┣ search_service.dart
 ┃ ┃ ┣ user_service.dart
 ┃ ┃ ┗ wine_service.dart
 ┃ ┣ utils
 ┃ ┃ ┣ api_client.dart
 ┃ ┃ ┣ date_time_util.dart
 ┃ ┃ ┣ feed_util.dart
 ┃ ┃ ┣ flag_util.dart
 ┃ ┃ ┗ global_config.dart
 ┃ ┣ widgets
 ┃ ┃ ┣ common
 ┃ ┃ ┃ ┣ atoms
 ┃ ┃ ┃ ┃ ┣ nation_flag_widget.dart
 ┃ ┃ ┃ ┃ ┣ wine_color_widget.dart
 ┃ ┃ ┃ ┃ ┣ wine_flavour_widget.dart
 ┃ ┃ ┃ ┃ ┣ wine_label_widget.dart
 ┃ ┃ ┃ ┃ ┣ wine_taste_chart_widget.dart
 ┃ ┃ ┃ ┃ ┗ wine_taste_param_widget.dart
 ┃ ┃ ┃ ┣ molecules
 ┃ ┃ ┃ ┃ ┣ custom_list_tile_widget.dart
 ┃ ┃ ┃ ┃ ┗ wine_item_widget.dart
 ┃ ┃ ┃ ┣ templates
 ┃ ┃ ┃ ┃ ┣ feed_item_widget.dart
 ┃ ┃ ┃ ┃ ┗ wine_detail_template.dart
 ┃ ┃ ┃ ┗ bottom_bar_widget.dart
 ┃ ┃ ┣ feed
 ┃ ┃ ┃ ┣ feed_item_widget.dart
 ┃ ┃ ┃ ┗ feed_wine_item.dart
 ┃ ┃ ┣ mypage
 ┃ ┃ ┃ ┣ bookmark_wine_item.dart
 ┃ ┃ ┃ ┣ cellar_wine_item.dart
 ┃ ┃ ┃ ┗ feed_item_widget.dart
 ┃ ┃ ┣ note
 ┃ ┃ ┃ ┣ note_detail_card_widget.dart
 ┃ ┃ ┃ ┣ note_list_card_widget.dart
 ┃ ┃ ┃ ┣ note_search_bar_widget.dart
 ┃ ┃ ┃ ┣ note_search_list_widget.dart
 ┃ ┃ ┃ ┣ note_select_color_widget.dart
 ┃ ┃ ┃ ┣ note_select_flavour_card_widget.dart
 ┃ ┃ ┃ ┣ note_select_flavour_widget.dart
 ┃ ┃ ┃ ┣ note_stt_widget.dart
 ┃ ┃ ┃ ┣ note_taste_widget.dart
 ┃ ┃ ┃ ┣ note_wine_card_widget.dart
 ┃ ┃ ┃ ┣ note_wine_item.dart
 ┃ ┃ ┃ ┗ note_write_opinion_widget.dart
 ┃ ┃ ┣ recommend
 ┃ ┃ ┃ ┗ recommend_wine_card_widget.dart
 ┃ ┃ ┣ search
 ┃ ┃ ┃ ┣ search_bar_widget.dart
 ┃ ┃ ┃ ┣ search_bookmark_widget.dart
 ┃ ┃ ┃ ┣ search_carousel_widget.dart
 ┃ ┃ ┃ ┣ search_cellar_widget.dart
 ┃ ┃ ┃ ┣ search_detail_wine_recommend_widget.dart
 ┃ ┃ ┃ ┣ search_wine_list_widget.dart
 ┃ ┃ ┃ ┣ search_wine_nation_widget.dart
 ┃ ┃ ┃ ┗ search_wine_type_widget.dart
 ┃ ┃ ┣ survey
 ┃ ┃ ┃ ┣ survey_range_slider_widget.dart
 ┃ ┃ ┃ ┣ survey_select_widget.dart
 ┃ ┃ ┃ ┗ survey_slider_widget.dart
 ┃ ┃ ┣ wine
 ┃ ┃ ┃ ┣ login_empty_animation.dart
 ┃ ┃ ┃ ┗ wine_item_widget.dart
 ┃ ┃ ┗ wine_item_widget.dart
 ┃ ┣ firebase_options.dart
 ┃ ┗ main.dart
 ┣ .flutter-plugins
 ┣ .flutter-plugins-dependencies
 ┣ .gitignore
 ┣ .metadata
 ┣ analysis_options.yaml
 ┣ devtools_options.yaml
 ┣ firebase.json
 ┣ frontend.iml
 ┣ Jenkinsfile
 ┣ pubspec.lock
 ┣ pubspec.yaml
 ┗ README.md

```
</details>

<details>
<summary>
<b>Backend</b>
</summary>

```log
backend
 ┣ .gradle
 ┣ build
 ┣ vinopener-api
 ┃ ┣ gradle
 ┃ ┣ src
 ┃ ┃ ┣ main
 ┃ ┃ ┃ ┣ java
 ┃ ┃ ┃ ┃ ┗ com
 ┃ ┃ ┃ ┃ ┃ ┗ ssafy
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ vinopener
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ domain
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ aichat
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatCreateResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatCreateAiMessageInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatCreateUserMessageInfo.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AssistantThreadEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AiChatErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AssistantThreadRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatSaveService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ AiChatService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ package-info.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ bookmark
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BookmarkGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkStatusGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BookmarkService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ cellar
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarUpdateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarStatusGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ feed
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedLikeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedWineEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedLikeMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedWineMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedLikeRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FeedRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedWineRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ FeedService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ preference
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceCreateOrUpdateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ PreferenceRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ PreferenceRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ package-info.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ recommendation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationGetListRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ContentRecommendationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ContentRecommendationEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ContentRecommendationRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ search
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ SearchService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ tastingnote
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteUpdateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ColorEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteFlavourEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteFlavourMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ColorRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ package-info.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ user
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ IndexHtmlController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ OAuth2Controller.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TokenEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ OAuth2ErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TokenRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ OAuth2Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ wine
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ controller
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatStompController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineController.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ data
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineCreateRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatGetOrGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineGetResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineTypeGetListResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTasteEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTypeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineFlavourEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineViewEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTasteMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTasteRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineFlavourRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineViewRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ service
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ package-info.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineChatService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineService.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ global
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ aiassistant
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ AssistantStream.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ annotations
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserPrincipalId.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BaseEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BaseTimeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ReferenceMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ props
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ GoogleClientProps.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ JwtProps.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ OpenAiProps.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ RedisProps.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ S3Props.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ExceptionConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ JpaAuditConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ KafkaProducerConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ OpenAiConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ QuerydslConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ S3Config.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ SecurityConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ SwaggerConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TimeFormatConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WebSocketConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ exception
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ GlobalExceptionHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ VinopenerException.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ jwt
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ JwtAuthenticationFilter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ JwtErrorCode.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ JwtProvider.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ KafkaProducer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ KafkaProducer.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ oauth2
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ dto
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ request
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ GoogleAccessTokenRequest.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ response
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ GoogleAccessTokenResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ GoogleAccountProfileResponse.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ GoogleClient.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TestPrincipal.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserPrincipal.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ recommendation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationProcessor.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ s3
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ S3Service.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ websocket
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ package-info.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ StompErrorHandler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ StompInterceptor.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ VinopenerApplication.java
 ┃ ┃ ┃ ┗ resources
 ┃ ┃ ┃ ┃ ┣ static
 ┃ ┃ ┃ ┃ ┃ ┗ index.html
 ┃ ┃ ┃ ┃ ┣ templates
 ┃ ┃ ┃ ┃ ┃ ┗ login.html
 ┃ ┃ ┃ ┃ ┣ application.yml
 ┃ ┃ ┃ ┃ ┣ data.sql
 ┃ ┃ ┃ ┃ ┗ schema.sql
 ┃ ┣ .gitignore
 ┃ ┣ build.gradle
 ┃ ┣ docker-run-gradle.sh
 ┃ ┣ Dockerfile
 ┃ ┣ gradlew
 ┃ ┣ gradlew.bat
 ┃ ┗ settings.gradle
 ┣ vinopener-batch
 ┃ ┣ gradle
 ┃ ┃ ┗ wrapper
 ┃ ┃ ┃ ┣ gradle-wrapper.jar
 ┃ ┃ ┃ ┗ gradle-wrapper.properties
 ┃ ┣ src
 ┃ ┃ ┣ main
 ┃ ┃ ┃ ┣ java
 ┃ ┃ ┃ ┃ ┗ coffee
 ┃ ┃ ┃ ┃ ┃ ┗ ssafy
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ vinopenerbatch
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ domain
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ cellar
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ CellarRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ CellarRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ preference
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ mapper
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ PreferenceRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ PreferenceRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ PreferenceRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ recommendation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ContentRecommendationType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ ContentRecommendationEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BehaviorRecommendationRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ContentRecommendationRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ContentRecommendationRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ContentRecommendationRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ RecommendationRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ tastingnote
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ColorEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteFlavourEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ TastingNoteRepositoryQuery.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TastingNoteRepositoryQueryImpl.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ user
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UserRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ wine
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ entity
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ enums
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineType.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTasteEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTypeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineViewEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ repository
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ FlavourTasteRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ WineRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ WineViewRepository.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ global
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ common
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BaseEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BaseTimeEntity.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ ReferenceMapper.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ TimeHolder.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ config
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ job
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ JobConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ step
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ StepConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UpdatePreferenceStepConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ BatchConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ KafkaConsumerConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ QuerydslConfig.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ reader
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateCellarReader.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdatePreferenceReader.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateRateReader.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UpdateViewReader.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ recommendation
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ RecommendationProcessor.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ scheduler
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ BatchScheduler.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ tasklet
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateCellarTasklet.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdatePreferenceTasklet.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateRateTasklet.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UpdateViewTasklet.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ writer
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateCellarWriter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdatePreferenceWriter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ UpdateRateWriter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ UpdateViewWriter.java
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ VinopenerBatchApplication.java
 ┃ ┃ ┃ ┗ resources
 ┃ ┃ ┃ ┃ ┗ application.yml
 ┃ ┣ .editorconfig
 ┃ ┣ .gitignore
 ┃ ┣ build.gradle
 ┃ ┣ Dockerfile
 ┃ ┣ gradlew
 ┃ ┣ gradlew.bat
 ┃ ┗ settings.gradle
 ┣ Caddyfile
 ┣ docker-compose.yml
 ┗ Jenkinsfile

```

</details>

# 시스템 아키텍처
![시스템아키텍처](https://github.com/thevinopener/vinopener/assets/33312417/5c1c5a84-1eb4-44ed-bbcc-4a1b781d35a7)

# ERD
![최종발표_ERD](https://github.com/thevinopener/vinopener/assets/33312417/1b956281-753f-4fd2-bbbe-b3d5738b772e)

# 화면 정의서

## WireFrame

### 전체 와이어 프레임

![WireFrame](https://github.com/thevinopener/vinopener/assets/33312417/594853b9-2988-45a9-8f67-1496053f65c1)

# 사용자 화면

## 로그인

#### 로그인 화면
![로그인](https://github.com/thevinopener/vinopener/assets/33312417/376974f1-5f3c-40ae-8a9e-1960e2f97f84)

#### 로그인 온보딩 샘플
![로그인_온보딩](https://github.com/thevinopener/vinopener/assets/33312417/0676524b-d4f9-482b-9cd3-ebde8d1e5522)

#### 선호도 조사
![선호도조사](https://github.com/thevinopener/vinopener/assets/33312417/fee4fff9-d0b9-4a24-9dae-938aa1e85b39)



## 추천

#### 메인화면
![메인화면_구경](https://github.com/thevinopener/vinopener/assets/33312417/21595983-a8f4-4fbd-b621-a3f6eb1a10ae)

## 검색

#### 타입별 검색
![와인_타입별_검색](https://github.com/thevinopener/vinopener/assets/33312417/f294e35c-a212-44a4-ae43-45b72fef32d0)

#### 국가별 검색
![와인_국가별_검색](https://github.com/thevinopener/vinopener/assets/33312417/db29fa71-c201-4199-bce2-c904354885c8)

#### 문자 검색
![문자 검색](https://github.com/thevinopener/vinopener/assets/33312417/fcd034de-b645-4ed9-b309-61b0b7b65707)

#### 검색 기록
![검색 기록](https://github.com/thevinopener/vinopener/assets/33312417/4e3e2f68-3866-464a-83a2-27c67a12e48c))

#### 검색 결과
![검색 결과](https://github.com/thevinopener/vinopener/assets/33312417/2dc49aae-1ce8-4228-ab5a-944b31a0b816)

#### 상세 조회
![와인 상세조회](https://github.com/thevinopener/vinopener/assets/33312417/ea1a39f0-da53-4286-8eb1-1124fbc7d091)

#### 이미지 검색
![OCR](https://github.com/thevinopener/vinopener/assets/33312417/a2c600cf-87ed-4aac-aa83-a6851e60c405)

## 피드

#### 피드 목록
![피드목록](https://github.com/thevinopener/vinopener/assets/33312417/270f8655-2d3c-4871-9913-eacb729d3624)

#### 피드 작성
![피드작성](https://github.com/thevinopener/vinopener/assets/33312417/e68c1789-2d0d-4484-847a-dded8bb47457)

## 테이스팅 노트

#### 노트 목록
![테노목록](https://github.com/thevinopener/vinopener/assets/33312417/f3354a5f-b6eb-4f4c-8e71-4635fde03057)

#### 일반 노트 작성
![일반 노트 작성](https://github.com/thevinopener/vinopener/assets/33312417/0e180fdb-ad70-4aef-a143-1255e6676a88)

#### AI 음성 노트작성
![AI 음성 노트 작성](https://github.com/thevinopener/vinopener/assets/33312417/0f61932f-976d-4f0b-9539-15fb7bde5f4a)

## 마이페이지

### 피드 / 즐겨찾기 / 셀러
![마페-피드_북마크_셀러](https://github.com/thevinopener/vinopener/assets/33312417/1758bd70-fff2-42cb-8605-9c5a9067b47e)

#### 피드 삭제
![피드삭제](https://github.com/thevinopener/vinopener/assets/33312417/94f3249d-127c-43bd-b0a3-80163ac389a6)

#### 로그아웃
![로그아웃](https://github.com/thevinopener/vinopener/assets/33312417/3f86bb81-8c32-4bc0-a323-f6f2156bfb0f)

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
  - 와인상세조회
  - 즐겨찾기 추가/삭제
  - 셀러 추가/삭제

- 피드

  - 피드 작성
  - 피드 목록조회
  - 게시글 좋아요
  - 피드 공유
  - 피드 삭제

- 테이스팅노트
  - 작성목록조회
  - 일반 작성
    1. 와인색 선택
    2. 와인향 선택
    3. 와인맛 선택(바디감 / 당도 / 산미 / 알코올감 / 탄닌)
    4. 와인 총평작성(의견 / 별점)
  - AI 작성(AI Assistant)

- 마이페이지
  - 내 피드목록 조회
  - 내 피드 공개여부 설정
  - 내 피드 삭제
  - 즐겨찾기 목록조회
  - 즐겨찾기 추가/삭제
  - 셀러 목록조회
  - 셀러 추가/삭제
  - 로그아웃


# 컨벤션

<details>
<summary>
<b>GIT</b>
</summary>

# Workflow

1. 양식에 맞춰 이슈를 생성합니다.
2. 컨벤션에 따라 브랜치를 생성합니다.
3. 컨벤션에 따라 커밋을 작성합니다.
4. 양식에 맞춰 머지 리퀘스트를 생성합니다.

# Branch

| 브랜치 이름 | 설명 |
| --- | --- |
| main | 기본 브랜치 |
| feat/{issue}-{part}-{feature}
ex ) feat / 1 - {be} - { login } | 기능 구현을 위해 생성하는 브랜치
e.g. 깃랩 이슈 69번에 해당하고 백엔드에서 로그인 API를 구현하는 경우
→ feat/69-be-login-api |
| hotfix/{yyyymmdd}-{number} | 배포 후 긴급 수정을 위해 생성하는 브랜치
e.g. 2024년 4월 8일에 두 번, 2024년 4월 9일에 한 번 생성하는 경우
→ hotfix/20240408-1, hotfix/20240408-2, hotfix/20240409-1 |
- 브랜치 이름은 소문자, 숫자, `/-`만 허용합니다.
- 대문자나 `_`를 사용하지 마세요.
- `/`는 딱 한 번만 쓰세요.
- **절대절대절대 main에서 feat로 merge하면 안됩니다.**
    - 대신 **rebase(fast-forward merge)**를 사용하세요.

### main

- 이 브랜치에서 직접 커밋하지 않습니다. (순수 문서 작업 제외)
- 반드시 GitLab의 Merge Request 기능을 통해 병합합니다.

### feat

- `issue`: 깃랩 이슈 번호
- `part`: 역할 (be, fe, infra, etc 등)
- `feature`: 기능이나 식별하기 편한 이름

### hotfix

- `yyyymmdd`: 오늘 날짜
- `number`: 오늘 핫픽스 순번

# Commit

커밋 메시지 구조는 다음과 같습니다.

```
type: subject (#issue)

body ← 생략 가능

footer ← 생략 가능
```

- `[#issue] type: subject`과 `body`, 그리고 `footer` 사이에는 개행(`\n`)이 반드시 2개 들어갑니다.
- e.g.
    
    ```
    refactor: 로그인 서비스의 쓸모없는 조건문 삭제 (#70)
    
    왜 쓸모없는 조건문인가?
    데드라인을 넘겨서 OAuth2 구현을 하지 않기로 했는데,
    이 코드는 OAuth2를 위한 코드기 때문이다.
    
    Close #70
    Co-Authored-By: 양희승 <heeseung0223@naver.com>
    ```
    

### type: subject (#issue)

- `type`: **주요 수정사항이 무엇인가?**
    - 자주 사용
        - `feat`: 기능 추가
        - `fix`: 버그 수정
        - `refactor`: 기능 개선 (코드를 얼마나 썼는지와 상관 없이 기능 추가가 아니면)
        - `build`: 빌드 관련 (빌드 스크립트 수정, 패키지 추가, 버전 업데이트 등)
        - `docs`: 문서 작업 (리드미, 산출물, 주석)
        - `chore`: 분류하기 애매한 노잼 작업들 → ex) DB 작업 등
    - 가끔 사용
        - `test`: 테스트 코드 추가
        - `style`: 코드 스타일 적용 → ex) 코딩 컨벤션
        - `revert`: 예전 코드로 롤백
        - `rename`: 파일 이름 변경
        - `remove`: 파일 삭제
        - `TEMP`: 임시용 (main 브랜치에 병합하면 안됩니다)
- `subject`: 한국어로 간결하고 명확하게 커밋 내용 요약 (50자 이내)
- `issue`: 깃랩 이슈 번호

### body

**이 커밋이 왜 필요한지** 설명할 때 적습니다.

- e.g. refactor 왜 했음? rename 왜 했음? revert 왜 했음? remove 왜 했음?
- 이 커밋을 어떻게 구현했는지 ← 이거 필요 없음

### footer

주로 커밋의 부가기능을 활용하고자 할 때 적습니다.

- `Close #n`: 커밋과 동시에 n번 이슈를 자동으로 닫고 싶을 때
- `Co-Authored-By: name <email>`: 공동으로 작업한 사람을 표시하고 싶을 때

# GitLab Issue

기본적으로 아래 양식을 사용합니다. 대충 적어도 되는데 이슈 생성은 필수입니다. 여기서 생성된 이슈 번호를 사용합니다.

```markdown
## Summary

이슈요약

## Todos

- [ ] 할일
- [ ] 또할일

```

# GitLab Merge Request

기본적으로 아래 양식을 사용합니다. 대충 적어도 되는데 이슈 번호는 필수입니다.

```markdown
## Summary

%{first_multiline_commit}

## Issue

- #69

## Checklist

- [ ] 깃 컨벤션
- [ ] 코드 스타일
- [ ] 로컬 테스트
- [ ] 코드 리뷰

## Screenshots

| Before | After  |
| ------ | ------ |
|        |        |

```

</details>
