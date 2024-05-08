# 포팅 매뉴얼

## 목차

- [포팅 매뉴얼](#포팅-매뉴얼)
  - [목차](#목차)
  - [시연 시나리오](#시연-시나리오)
  - [외부 서비스](#외부-서비스)
  - [개발 환경](#개발-환경)
    - [scoop 설치](#scoop-설치)
    - [백엔드](#백엔드)
    - [프론트엔드](#프론트엔드)
  - [배포 환경](#배포-환경)
    - [docker 설치](#docker-설치)
    - [Jenkins](#jenkins)
      - [1. System](#1-system)
      - [2. Tools](#2-tools)
      - [3. Credentials](#3-credentials)
      - [4. New Item (New Job)](#4-new-item-new-job)
  - [운영](#운영)
    - [윈도우 개발환경에서 콘솔상 JDK 환경 변경](#윈도우-개발환경에서-콘솔상-jdk-환경-변경)
    - [배포된 백엔드 로그 확인](#배포된-백엔드-로그-확인)
    - [배포된 백엔드 DB 초기화](#배포된-백엔드-db-초기화)
    - [배포된 백엔드 DB 접속](#배포된-백엔드-db-접속)

## 시연 시나리오

## 외부 서비스

- Amazon EC2
- Amazon S3

## 개발 환경

- Windows 10 or 11
- scoop

### scoop 설치

scoop은 이 프로젝트에서 Windows 개발 환경 설정을 위해 사용하는 패키지 매니저다.
일반적으로 다음 명령어를 통해 설치한다.

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop bucket add extras java
```

SSAFY 노트북과 같이 관리자 권한이 기본 설정된 경우에는 대신 다음 명령어로 설치한다.

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
scoop bucket add extras java
```

### 백엔드

- Java 21
- Redis
- MariaDB

백엔드 개발 환경에 필요한 종속성 패키지를 설치한다.

```powershell
scoop install temurin21-jdk redis mariadb
```

Redis는 다음 명령어를 통해 포어그라운드로 실행한다.
```powershell
redis-server
```

MariaDB는 다음 명령어를 통해 포어그라운드로 실행한다.

```powershell
mysqld --standalone
```

로컬 테스트를 위해 다음 명령어를 통해 ID와 PW가 `ssafy`인 MariaDB 계정을 생성한다.

```sql
mysql -u root

-- 로그인 후
CREATE USER 'ssafy'@'localhost' IDENTIFIED BY 'ssafy';
GRANT ALL PRIVILEGES ON *.* TO 'ssafy'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit;
```

로컬 테스트를 위해 다음 명령어를 통해 `vinopener` 데이터베이스를 생성한다.
```sql
mysql -u ssafy -pssafy

-- 로그인 후
CREATE DATABASE vinopener CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
exit;
```

api 서버 빌드가 필요할 경우 다음 명령어를 실행한다.

```powershell
cd backend/vinopener-api
./gradlew clean bootJar
```

api 서버 실행이 필요할 경우 다음 명령어를 실행한다.

```powershell
cd backend/vinopener-api
./gradlew clean bootRun
```

기본으로 설정된 H2 대신 MariaDB에 연결하려면 다음 명령어와 같이 local 프로필을 활성화한다.

```powershell
cd backend/vinopener-api
./gradlew clean bootRun --args='spring.profiles.active=local'
```

### 프론트엔드

- Java 17
- Flutter
- Android Studio

프론트엔드 개발 환경에 필요한 종속성 패키지를 설치한다.
android-clt는 android studio를 통한 android sdk 및 command-line tools 설치로 대체될 수 있다.

```powershell
scoop install temurin17-jdk flutter android-clt
```

apk 빌드가 필요할 경우 다음 명령어를 실행한다.

```powershell
cd frontend
flutter build apk --release --target-platform android-arm64 --split-per-abi
```

## 배포 환경

arm 아키텍처에서는 flutter 빌드 수행에 이슈가 있으므로 amd64 (x86-64) 아키텍처를 사용한다.

- Linux Ubuntu 22.04 or 24.04 (amd64)
- docker

### docker 설치

AWS EC2 생성 시 user-data (init-script)에 다음 정보를 기입하거나 콘솔에서 직접 실행하여 docker를 설치한다.

```sh
#!/bin/sh
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the Docker packages:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add your user to the docker group:
sudo usermod -aG docker $USER
```

### Jenkins

Jenkins는 기본적으로 `jenkins.thevinopener.com` 도메인을 가정한다.
변경이 필요하면 [jenkins/Caddyfile](/jenkins/Caddyfile) 파일을 수정한다.

만약 Jenkins 서버와 백엔드 서버가 동일한 컴퓨트 인스턴스에 배포될 경우
443 포트에서 충돌하므로 이 경우에도 Caddyfile 파일 수정이 필요하다.

```Caddyfile
jenkins.thevinopener.com

reverse_proxy jenkins:8080
```

설정이 완료되면 다음 명령어를 실행하여 Jenkins를 배포한다.

```sh
docker compose -p jenkins up -d
```

Jenkins 배포 후 [jenkins/README.md](/jenkins/README.md)에 명시된 플러그인을 설치하고,
System부터 New Item까지 지시에 따라 설정한다.

#### 1. System

1. System
   - 인스턴스 성능이 Flutter 최저 사양(ram 8gb)일 경우, of executors를 `2`에서 `1`로 변경한다.
2. GitLab Branch Source
   - GitLab을 Multibranch Job에서 불러오기 위해 사용한다.
   - Server URL: `https://lab.ssafy.com`
   - GitLab Personal Access Token을 발급하고 `Secret text` 종류로 Credentials를 설정
     - 토큰 권한: `api`, `repo (read-only)`
   - Manage Web Hooks: 체크 설정
   - Test Connection이 성공하는지 확인한다.
3. Publish over SSH
   - 백엔드 배포를 위해 사용한다.
   - SSH Server를 다음과 같이 설정한다. (Hostname은 변경될 수 있다)
     - Name: `vinopener-backend-ssh-publish`
     - Hostname: `api.thevinopener.com`
     - Username: `ubuntu`
     - Remote Directory `/home/ubuntu`
   - `고급`에서 `Use password authentication, or use a different key`를 설정한다.
     1. 아래 명령어를 통해 ssh 접속에 사용되는 secret key에 passphrase를 추가한다.
        ```sh
        openssl rsa -in K10C207T.pem -out K10C207T-encrypted.pem -aes256
        ```
     2. 생성된 secret key와 대응하는 passphrase를 설정에 기입한다.
   - Test Configuration이 성공하는지 확인한다.
4. Global Mattermost Notifier Settings
   - 파이프라인 실패시 메시징 앱을 통해 팀원에게 알리기 위해 사용한다.
   - Mattermost의 통합(Integration) 설정에서 추가한 Incoming Webhook을 기입한다.
   - Test Connection이 성공하는지 확인한다.

#### 2. Tools

1. JDK
   - Name `jdk-17`을 생성하고 다음과 같이 설정한다.
     - Install automatically
       - Extract *.zip/*.tar.gz
         - Download URL for binary archive: `https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%2B9/OpenJDK17U-jdk_x64_linux_hotspot_17.0.11_9.tar.gz`
         - Subdirectory of extracted archive: `jdk-17.0.11+9`
   - Name `jdk-21`을 생성하고 다음과 같이 설정한다.
     - Install automatically
       - Extract *.zip/*.tar.gz
         - Download URL for binary archive: `https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3%2B9/OpenJDK21U-jdk_x64_linux_hotspot_21.0.3_9.tar.gz`
         - Subdirectory of extracted archive: `jdk-21.0.3+9`
2. Gradle
   - Name `gradle-7.6`을 생성하고 다음과 같이 설정한다.
     - Install automatically
       - Install from Gradle.org
         - Version: `Gradle 7.6.4`
   - Name `gradle-8.7`을 생성하고 다음과 같이 설정한다.
     - Install automatically
       - Install from Gradle.org
         - Version: `Gradle 8.7`

#### 3. Credentials

[backend/docker-compose.yml](/backend/docker-compose.yml)에서 요구하는 환경변수 파일을 생성한다.
환경변수 파일 내용은 다음과 같이 작성한다.
(`MARIADB_PASSWORD`, `OAUTH2_GOOGLE_CLIENT_SECRET`, `S3_SECRET_ACCESS_KEY`, `OPENAI_API_KEY` 명시 필요)

```properties
MARIADB_DATABASE=vinopener
MARIADB_USER=S10P31C207
MARIADB_PASSWORD=
OAUTH2_GOOGLE_CLIENT_ID=149686988355-moqaqo6seo7dhe9f4tf5okrkmum6groc.apps.googleusercontent.com
OAUTH2_GOOGLE_CLIENT_SECRET=
JWT_ACCESS_SECRET_KEY_BASE64=iAbBnFDrPJgglJr+yO0dC1qITxoCJcm1HB8ZiFWhtN19lWOdCaiPmvqXRTLmqe4cIdaT5X62swd/8lfp8rdw0Q==
JWT_ACCESS_EXPIRATION_SECONDS=300
JWT_REFRESH_SECRET_KEY_BASE64=zxY3hKXBd6MPmmxha1rwte7GayIdjuzOTeD6nyuO7MockdamStat6G0nDF2T8EJP041sdz4eZxEPNJEGIXGmiQ==
JWT_REFRESH_EXPIRATION_SECONDS=86400
S3_ACCESS_KEY_ID=fdf93e9ebca3758be5780b04ad55ab21
S3_SECRET_ACCESS_KEY=
S3_REGION=apac
S3_BUCKET=vinopener
S3_ENDPOINT=
S3_PUBLIC_BASE_URL=https://img.vinopener.com
OPENAI_API_KEY=
OPENAI_ORGANIZATION_ID=org-hYwHHXnbAW10KjvuRu37LBi2
OPENAI_PROJECT_ID=proj_5P5XyrswJdCEAV9Qr31VGT1o
```

작성한 환경변수 파일을 `Secret file` Credentials에 업로드하고 ID를 `vinopener-backend-dotenv`로 설정한다.

#### 4. New Item (New Job)

1. Multibranch Pipeline으로 `vinopener-backend`을 생성한다.
   - Branch Sources에 GitLab Project를 추가하고 Checkout Credentials에 username와 personal-access-token 조합을 등록한다.
   - Owner에 `s10-final`, Projects에 `s10-final/S10P31C207`을 지정한다.
   - Behaviours에 Filter by name (with wildcards)를 추가한다.
     - Include: `*`
     - Exclude: `feat/*-fe-*`
   - Build strategies에 Accept build by included regions strategy를 추가한다.
     - Trigger builds for included regions: `backend/**/*`
   - Build Configuration의 Script Path를 `backend/Jenkinsfile`로 설정한다.
   - Save를 누르고 be 브랜치 스캔과 main 브랜치 배포가 제대로 수행되는지 확인한다.
2. Multibranch Pipeline으로 `vinopener-frontend`을 생성한다.
   - Branch Sources에 GitLab Project를 추가하고 Checkout Credentials에 username와 personal-access-token 조합을 등록한다.
   - Owner에 `s10-final`, Projects에 `s10-final/S10P31C207`을 지정한다.
   - Behaviours에 Filter by name (with wildcards)를 추가한다.
     - Include: `*`
     - Exclude: `feat/*-be-*`
   - Build strategies에 Accept build by included regions strategy를 추가한다.
     - Trigger builds for included regions: `frontend/**/*`
   - Build Configuration의 Script Path를 `frontend/Jenkinsfile`로 설정한다.
   - Save를 누르고 fe 브랜치 스캔과 main 브랜치 배포가 제대로 수행되는지 확인한다.

## 운영

### 윈도우 개발환경에서 콘솔상 JDK 환경 변경

예를 들어, temurin17-jdk과 temurin21-jdk이 모두 설치되어 있고 현재 콘솔 환경은 temurin21-jdk인데
temurin17-jdk로 전환하고 싶다면 다음 명령어를 실행하면 된다.

```powershell
scoop reset temurin17-jdk
```

반대로 다시 temurin21-jdk로 변경하고 싶다면 다음 명령어를 실행하면 된다.

```powershell
scoop reset temurin21-jdk
```

### 배포된 백엔드 로그 확인

배포된 서버의 로그는 다음 명령어 실행을 통해 확인할 수 있다.
docker compose로 배포된 모든 컨테이너의 로그를 확인하는 경우는 다음과 같다.

```sh
docker compose -p vinopener-backend logs
```

`vinopener-api` 같은 특정 컨테이너의 로그를 확인하는 명령어 예시는 다음과 같다.

```sh
docker compose -p vinopener-backend logs vinopener-api
```

실시간으로 갱신되는 로그를 확인하는 명령어 예시는 다음과 같다.
```sh
docker compose -p vinopener-backend logs vinopener-api -f
```

### 배포된 백엔드 DB 초기화

[schema.sql](/backend/vinopener-api/src/main/resources/schema.sql) 또는
[data.sql](/backend/vinopener-api/src/main/resources/data.sql) 파일을 수정한 경우,
다음 명령어를 수행하여 DB 테이블과 초기 데이터을 다시 설정할 수 있다.

```sh
cd ~/vinopener-ssh-publish/
docker compose -p vinopener-backend down && \
  docker volume rm vinopener-backend_mysql_data && \
  docker compose -p vinopener-backend up -d
```

### 배포된 백엔드 DB 접속

배포 중인 mariadb는 포트를 인스턴스 외부에 노출하지 않도록 설정되어 있으므로
다음 명령어를 통해 mysql 콘솔에 접속해야 한다.

```sh
docker compose -p vinopener-backend exec mariadb mariadb -u S10P31C207 -p
```

