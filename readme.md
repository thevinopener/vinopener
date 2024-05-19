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
![redis](https://img.shields.io/badge/redis-DC382D.svg?style=for-the-badge&logo=redis&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white)

**Frontend**
![Flutter](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

**Database**

![MySQL](https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

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

## FRONTEND

```ini
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

## BAKEND
```ini
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

![SystemArchitecture](/uploads/08ad96874b133486caa42f4c3ea726c7/SystemArchitecture.png)

# ERD

![ERD]()


# 화면 정의서

## WireFrame

### 전체 와이어 프레임

![WireFrame](/uploads/b20770906a74f202649025aefc6b573b/WireFrame.png)


---
# 사용자 화면

## 로그인

![로그인]()
#### 로그인

![로그인_온보딩](/uploads/7101834d1b0e80b18d25cd1cb44437ee/로그인_온보딩.gif)
#### 로그인 온보딩 샘플

![선호도조사](/uploads/59ff0dfcfcc6967c20f89ae4e21807f9/선호도조사.gif)
#### 설문조사

---

## 추천

![메인화면_구경](/uploads/8e4b710cf5f1f3fdcd7bf708f80322ac/메인화면_구경.gif)
#### 메인화면

![와인_상세조회](/uploads/c420d1846a508c7876b25f59e114317a/와인_상세조회.gif)
#### 와인상세조회

---

## 검색

![와인_타입별_검색](/uploads/a33f4c5326dc56e8ca9ce96998335641/와인_타입별_검색.gif)
#### 타입별검색

![와인_국가별_검색](/uploads/4a28a60c6543ea13e17a88629ecbf4d9/와인_국가별_검색.gif)
#### 국가별검색

![문자검색]()
#### 문자검색

![검색기록]()
#### 검색기록

![검색결과]()
#### 검색결과

![상세조회]()
#### 상세조회

![사진검색]()
#### 사진검색

---

## 피드

![피드목록]()
#### 피드목록

![피드작성]()
#### 피드작성

![피드공유]()
#### 피드공유

---

## 테이스팅 노트

![노트목록]()
#### 노트목록

![노트작성 1단계]()
#### 노트작성 (1/4)

![노트작성 2단계]()
#### 노트작성 (2/4)

![노트작성 3단계]()
#### 노트작성 (3/4)

![노트작성 4단계]()
#### 노트작성 (4/4)

![음성노트작성 1단계]()
#### 음성노트작성 (1/4)

![음성노트작성 2단계]()
#### 음성노트작성 (2/4)

![음성노트작성 3단계]()
#### 음성노트작성 (3/4)

![음성노트작성 4단계]()
#### 음성노트작성 (4/4)

---

## 마이페이지

![피드목록]()
#### 내 피드 목록

![피드삭제]()
#### 피드삭제

![즐겨찾기]()
#### 즐겨찾기

![셀러]()
#### 셀러

![로그아웃]()
#### 로그아웃

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
  - 와인상세조회
  - 즐겨찾기 추가/삭제
  - 셀러 추가/삭제

- 피드

  - 피드작성
  - 피드목록조회
  - 게시글 좋아요
  - 피드 공유
  - 피드삭제

- 테이스팅노트
  - 작성목록조회
  - 작성: 와인색 선택 (1/4)
  - 작성: 와인향 선택 (2/4)
  - 작성: 와인맛 선택 (바디감/당도/산미/알코올감/타닌) (3/4)
  - 작성: 와인 총평작성 (의견/별점) (4/4)
  - 작성: AI Assistant

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
