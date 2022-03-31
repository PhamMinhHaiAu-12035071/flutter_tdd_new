# flutter_tdd_new
This is template project used TDD and BLoC patterns with multiple environments and flavor

# Mục lục
* [1. Feature](#1.-Feature)
* [2. Project structure](#2.-Project-structure)  
* [3. Requirements](#3.-Requirements)
* [4. Help command](#4.-Help command) 
* [5. Install](#5.-Install)
* [6. Generate file command](#6.-Generate-file-command)
* [7. Uninstall](#7.-Uninstall)
* [8. Run code on Emulator](#8.-Run-code-on-Emulator)
  - [8.1 Android](#8.1-Android)
    * [8.1.1 development environment](#8.1.1-development-environment)
      - [8.1.1.1 debug mode](#8.1.1.1-debug-mode)
      - [8.1.1.2 profile mode](#8.1.1.2-profile-mode)
      - [8.1.1.3 release mode](#8.1.1.3-release-mode)
    * [8.1.2 staging environment](#8.1.2-staging-environment)
      - [8.1.2.1 debug mode](#8.1.2.1-debug-mode)
      - [8.1.2.2 profile mode](#8.1.2.2-profile-mode)
      - [8.1.2.3 release mode](#8.1.2.3-release-mode)
    * [8.1.3 production environment](#8.1.3-production-environment)
      - [8.1.3.1 debug mode](#8.1.3.1-debug-mode)
      - [8.1.3.2 profile mode](#8.1.3.2-profile-mode)
      - [8.1.3.3 release mode](#8.1.3.3-release-mode)  
* [9. Run web server](#9.-Run-web-server)
  - [9.1 development environment](#9.1-development-environment)
    * [9.1.1 debug mode](#9.1.1-debug-mode)
    * [9.1.2 profile mode](#9.1.2-profile-mode)
    * [9.1.3 release mode](#9.1.3 release mode)
  - [9.2 staging environment](#9.2-staging-environment)
    * [9.2.1 debug mode](#9.2.1-debug-mode)
    * [9.2.2 profile mode](#9.2.2-profile-mode)
    * [9.2.3 release mode](#9.2.3 release mode)
  - [9.3 production environment](#9.3-production-environment)
    * [9.3.1 debug mode](#9.3.1-debug-mode)
    * [9.3.2 profile mode](#9.3.2-profile-mode)
    * [9.3.3 release mode](#9.3.3 release mode)
* [10. Run web](#10.-Run-web)
  - [10.1 development environment](#10.1-development-environment)  
    * [10.1.1 debug mode](#10.1.1-debug-mode)
    * [10.1.2 profile mode](#10.1.2-profile-mode)
    * [10.1.3 release mode](#10.1.3 release mode)
  - [10.2 staging environment](#10.2-staging-environment)
    * [10.2.1 debug mode](#10.2.1-debug-mode)
    * [10.2.2 profile mode](#10.2.2-profile-mode)
    * [10.2.3 release mode](#10.2.3 release mode)
  - [10.3 production environment](#10.3-production-environment)
    * [10.3.1 debug mode](#10.3.1-debug-mode)
    * [10.3.2 profile mode](#10.3.2-profile-mode)
    * [10.3.3 release mode](#10.3.3 release mode)
* [11. Run unit test](#11.-Run-unit-test)
* [12. Run unit test and coverage](#12.-Run-unit-test-and-coverage)
* [13. Run automation test on emulator](#13.-Run-automation-test-on-emulator)
  - [Trên IOS với android studio](#trên-ios-với-android-studio)
  - [13.1 Android](#13.1-Android)
    - [13.1.1 Install Android Studio](#13.1.1-Install-Android-Studio)
    * [13.1.2 development environment](#13.1.2-development-environment)
      - [13.1.2.1 debug mode](#13.1.2.1-debug-mode)
      - [13.1.2.2 profile mode](#13.1.2.2-profile-mode)
      - [13.1.2.3 release mode](#13.1.2.3-release-mode)
    * [13.1.3 staging environment](#13.1.3-staging-environment)
      - [13.1.3.1 debug mode](#13.1.3.1-debug-mode)
      - [13.1.3.2 profile mode](#13.1.3.2-profile-mode)
      - [13.1.3.3 release mode](#13.1.3.3-release-mode)
    * [13.1.4 production environment](#13.1.4-production-environment)
      - [13.1.4.1 debug mode](#13.1.4.1-debug-mode)
      - [13.1.4.2 profile mode](#13.1.4.2-profile-mode)
      - [13.1.4.3 release mode](#13.1.4.3-release-mode)
* [14. Run automation test on real device](#14.-Run-automation-test-on-real-device)
  - [Trên IOS thật với xcode](#trên-ios-thật-với-xcode)
  - [14.1 Android](#14.1-Android)
    * [14.1.1 development environment](#14.1.1-development-environment)
      - [14.1.1.1 debug mode](#14.1.1.1-debug-mode)
      - [14.1.1.2 profile mode](#14.1.1.2-profile-mode)
      - [14.1.1.3 release mode](#14.1.1.3-release-mode)
    * [14.1.2 staging environment](#14.1.2-staging-environment)
      - [14.1.2.1 debug mode](#14.1.2.1-debug-mode)
      - [14.1.2.2 profile mode](#14.1.2.2-profile-mode)
      - [14.1.2.3 release mode](#14.1.2.3-release-mode)
    * [14.1.3 production environment](#14.1.3-production-environment)
      - [14.1.3.1 debug mode](#14.1.3.1-debug-mode)
      - [14.1.3.2 profile mode](#14.1.3.2-profile-mode)
      - [14.1.3.3 release mode](#14.1.3.3-release-mode)
* [15. Issues to keep in mind when running automation tests in the browser](#15.-Issues-to-keep-in-mind-when-running-automation-tests-in-the-browser)  
* [16. Run automation test on chrome](#16.-Run-automation-test-on-chrome)
  - [16.1 development environment](#16.1-development-environment)
    * [16.1.1 debug mode](#16.1.1-debug-mode)
    * [16.1.2 profile mode](#16.1.2-profile-mode)
    * [16.1.3 release mode](#16.1.3-release-mode)
  - [16.2 staging environment](#16.2-staging-environment)
    * [16.2.1 debug mode](#16.2.1-debug-mode)
    * [16.2.2 profile mode](#16.2.2-profile-mode)
    * [16.2.3 release mode](#16.2.3-release-mode)
  - [16.3 production environment](#16.3-production-environment)
    * [16.3.1 debug mode](#16.3.1-debug-mode)
    * [16.3.2 profile mode](#16.3.2-profile-mode)
    * [16.3.3 release mode](#16.3.3-release-mode)
* [17. Run automation test on firefox](#17.-Run-automation-test-on-firefox)
  - [17.1 development environment](#17.1-development-environment)
    * [17.1.1 debug mode](#17.1.1-debug-mode)
    * [17.1.2 profile mode](#17.1.2-profile-mode)
    * [17.1.3 release mode](#17.1.3-release-mode)
  - [17.2 staging environment](#17.2-staging-environment)
    * [17.2.1 debug mode](#17.2.1-debug-mode)
    * [17.2.2 profile mode](#17.2.2-profile-mode)
    * [17.2.3 release mode](#17.2.3-release-mode)
  - [17.3 production environment](#17.3-production-environment)
    * [17.3.1 debug mode](#17.3.1-debug-mode)
    * [17.3.2 profile mode](#17.3.2-profile-mode)
    * [17.3.3 release mode](#17.3.3-release-mode)
* [18. Run automation test on safari](#18.-Run-automation-test-on-safari)
  - [18.1 development environment](#18.1-development-environment)
    * [18.1.1 debug mode](#18.1.1-debug-mode)
    * [18.1.2 profile mode](#18.1.2-profile-mode)
    * [18.1.3 release mode](#18.1.3-release-mode)
  - [18.2 staging environment](#18.2-staging-environment)
    * [18.2.1 debug mode](#18.2.1-debug-mode)
    * [18.2.2 profile mode](#18.2.2-profile-mode)
    * [18.2.3 release mode](#18.2.3-release-mode)
  - [18.3 production environment](#18.3-production-environment)
    * [18.3.1 debug mode](#18.3.1-debug-mode)
    * [18.3.2 profile mode](#18.3.2-profile-mode)
    * [18.3.3 release mode](#18.3.3-release-mode)
* [19. Run automation test on edge](#19.-Run-automation-test-on-edge)
* [20. Inspiration](#20.-Inspiration)
* [21. Author](#21.-Author)
* [22. Contributing](#22.-Contributing)
* [23. Documentation](#23.-Documentation)
* [24. Thanks](#24.-Thanks)

## 1. Feature

- [x] Using BLoC architecture is easy to maintain
- [x] Support unit testing
- [x] Support integration test(end to end testing)

## 2. Project structure

    .    
    ├── integration_test                                 # The directory automation test
    ├── ios                                              # The directory native code ios
    ├── android                                          # The directory native code android
    ├── lib                                              # The directory project
    |   ├── configs                                      # The directory config and routes
    |   ├── constants                                    
    |   ├── modules                                      # The directory contains all applications feature
    |   ├── shared                                       # The directory commons (widgets, third party...)
    |   ├── utilities                                    # The directory contains all functions useful
    ├── scripts                                          # The directory contains all file shell scripts
    ├── test                                             # The directory contains all file unit-test
    ├── test_driver                                      # The directory contains all file driver test
    ├── web                                              # The directory contains web
    ├── windows                                          # The directory contains windows
    ├── analysis_options.yaml                            # The file setting lint code
    ├── build.yaml                                       # The file setting gherkin
    ├── lefthook.yml                                     # The file setting pre-hook git
    ├── Makefile                                         # The file contains all commands
    └── README.md                                        # Documents

## 3. Requirements

- Install [Nodejs version 14](https://nodejs.org/en/)
- Install [Yarn](https://yarnpkg.com/)
- Install [Flutter](https://docs.flutter.dev/get-started/install)
- Install [Java 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)

## 4. Help command

```bash
make
```

or 

```bash
make help
```

## 5. Install

- [x] Install package.json
- [x] Install pubspec.yaml
- [x] Run script set chmod

```bash
make install
```

## 6. Generate file command

- [x] Generate file json_serializable
- [x] Generate file gherkin test

```bash
make rebuild
```

## 7. Uninstall

- [x] Remove node_modules
- [x] Remove cache pub
- [x] Remove file generated

```bash
make clean
```

> Notes: Should run **make install** again

## 8. Run code on Emulator

### 8.1 Android

#### 8.1.1 development environment

##### 8.1.1.1 debug mode

```bash
make emulator_dev_debug
```

##### 8.1.1.2 profile mode

- **Requirements**:
  - Android emulator must support instruction: **arm64-v8a**
  - If you want to check android emulator to have support for**arm64-v8a** or not ? Please install third-party software [Device Info](https://play.google.com/store/apps/details?id=com.alphabetlabs.deviceinfo&hl=en&gl=US)

```bash
make emulator_dev_profile
```

##### 8.1.1.3 release mode

- **Requirements**:
  - Android emulator must support instruction: **arm64-v8a**
  - If you want to check android emulator to have support for**arm64-v8a** or not ? Please install third-party software [Device Info](https://play.google.com/store/apps/details?id=com.alphabetlabs.deviceinfo&hl=en&gl=US)

```bash
make emulator_dev_release
```

#### 8.1.2 staging environment

##### 8.1.2.1 debug mode

```bash
make emulator_stg_debug
```

##### 8.1.2.2 profile mode

```bash
make emulator_stg_profile
```

##### 8.1.2.3 release mode

```bash
make emulator_stg_release
```

#### 8.1.3 production environment

##### 8.1.3.1 debug mode

```bash
make emulator_prod_debug
```

##### 8.1.3.2 profile mode

```bash
make emulator_prod_profile
```

##### 8.1.3.3 release mode

```bash
make emulator_prod_release
```

## 9. Run web server

- Quickly launching flutter on localhost server will have to be hot-reloaded manually

### 9.1 development environment

#### 9.1.1 debug mode

```bash
make web_server_dev_debug
```

#### 9.1.2 profile mode

```bash
make web_server_dev_profile
```

#### 9.1.3 release mode

```bash
make web_server_dev_release
```

### 9.2 staging environment

#### 9.2.1 debug mode

```bash
make web_server_stg_debug
```

#### 9.2.2 profile mode

```bash
make web_server_stg_profile
```

#### 9.2.3 release mode

```bash
make web_server_stg_release
```

### 9.3 production environment

#### 9.3.1 debug mode

```bash
make web_server_prod_debug
```

#### 9.3.2 profile mode

```bash
make web_server_prod_profile
```

#### 9.3.3 release mode

```bash
make web_server_prod_release
```

## 10. Run web

- Initialize flutter on web browser (default uses chrome browser)

### 10.1 development environment

- Link [web-renderers](https://docs.flutter.dev/development/tools/web-renderers)

#### 10.1.1 debug mode

```bash
make web_dev_debug
```

#### 10.1.2 profile mode

```bash
make web_dev_profile
```

#### 10.1.3 release mode

```bash
make web_dev_release
```

### 10.2 staging environment

#### 10.2.1 debug mode

```bash
make web_stg_debug
```

#### 10.2.2 profile mode

```bash
make web_stg_profile
```

#### 10.2.3 release mode

```bash
make web_stg_release
```

### 10.3 production environment

#### 10.3.1 debug mode

```bash
make web_prod_debug
```

#### 10.3.2 profile mode

```bash
make web_prod_profile
```

#### 10.3.3 release mode

```bash
make web_prod_release
```

## 11. Run unit test

```bash
make test
```

## 12. Run unit test and coverage

```bash
make coverage
```

## 13. Run automation test on emulator

### Trên IOS với android studio

- **Bước 1**: Mở Android Studio -> chọn **Open iOS Simulator**

    <img width="894" alt="image" src="https://user-images.githubusercontent.com/14148177/159907228-a5674192-d928-452c-ab40-0e6d7ee70d39.png">

- **Bước 2**: Chờ IOS emulator được khởi động

    <img width="349" alt="image" src="https://user-images.githubusercontent.com/14148177/159907551-09d47548-3250-4768-9f0e-cbb0747ddbcc.png">

- **Bước 3**: Chạy lệnh test

    ```bash
    make integration_test_device
    ```

    <img width="1156" alt="image" src="https://user-images.githubusercontent.com/14148177/159907860-58095911-91e6-4ae6-9fbf-758d8e10fef2.png">

### 13.1 Android

#### 13.1.1 Install [Android Studio](https://developer.android.com/studio)

- **Suggest**: should install [Genymotion](https://www.genymotion.com/) and [Virtualbox](https://www.macupdate.com/app/mac/24801/virtualbox) to run android emulator faster.

- **Step 1**: Change view **toolbar**

    Open Android Studio -> **View** -> **Appearance** -> **Toolbar**

- **Step 2**: Install plugin **Genymotion**

    Open Android Studio -> **Preferences** -> **Plugins** -> Gõ "Genymotion" -> **Install**

- **Step 3**: Set path app Genymotion

    Open Android Studio -> **Preferences** -> Gõ "Genymotion" -> **Genymotion Plugin** -> Set path **/Applications/Genymotion.app**

- **Step 4**: Run Android emulator

    Click icon 'Genymotion' -> Choose device -> **Start**

- **Step 5**: Waiting build successfully

- **Step 6**: Run test with specific environment and mode.

#### 13.1.2 development environment

##### 13.1.2.1 debug mode

```bash
make integration_test_device_dev_debug
```

##### 13.1.2.2 profile mode

- **Requirements**:
  - Android emulator must support instruction: **arm64-v8a**
  - If you want to check android emulator to have support for**arm64-v8a** or not ? Please install third-party software [Device Info](https://play.google.com/store/apps/details?id=com.alphabetlabs.deviceinfo&hl=en&gl=US)
  
```bash
make integration_test_device_dev_profile
```

##### 13.1.2.3 release mode

- Not support

#### 13.1.3 staging environment

##### 13.1.3.1 debug mode

```bash
make integration_test_device_staging_debug
```

##### 13.1.3.2 profile mode

- **Requirements**:
  - Android emulator must support instruction: **arm64-v8a**
  - If you want to check android emulator to have support for**arm64-v8a** or not ? Please install third-party software [Device Info](https://play.google.com/store/apps/details?id=com.alphabetlabs.deviceinfo&hl=en&gl=US)
  
```bash
make integration_test_device_staging_profile
```

##### 13.1.3.3 release mode

- Not support

#### 13.1.4 production environment

##### 13.1.4.1 debug mode

```bash
make integration_test_device_production_debug
```

##### 13.1.4.2 profile mode

```bash
make integration_test_device_production_profile
```

##### 13.1.4.3 release mode

- Not support

## 14. Run automation test on real device

### Trên IOS thật với xcode

- **Bước 1**: Mở Xcode

    Tại thư mục dự án gõ lệnh:

    ```bash
    cd ios/
    ```
    Mở xcode bằng command:

    ```bash
    xed .
    ```
    
    https://user-images.githubusercontent.com/14148177/159926408-af240e8f-2c18-4dba-ba3e-067167a41599.mov

- **Bước 2**: Chờ xcode build thành công

    <img width="1413" alt="image" src="https://user-images.githubusercontent.com/14148177/159927241-7cca144c-17a4-47b1-9926-dbbb7e18f35c.png">

- **Bước 3**: Cắm USB kết nối đến thiết bị iphone

    <img width="1381" alt="image" src="https://user-images.githubusercontent.com/14148177/159927592-56342305-3542-4268-8eef-fdc405288415.png">

- **Bước 4**: Đăng kí file signingConfig

    Bạn cần phải có một tài khoản apple -> đăng nhập -> Chọn **Signing & Capabilities**

    <img width="1168" alt="image" src="https://user-images.githubusercontent.com/14148177/159930207-a7181745-5431-4b20-ba1d-ee42b503181f.png">

- **Bước 5**: Chạy lệnh để build lại file testcase

    ```bash
    make integration_test_real_device_ios
    ```
    
    <img width="1131" alt="image" src="https://user-images.githubusercontent.com/14148177/159928269-b9e6ec8c-6957-4bc2-8954-6050137406e5.png">

- **Bước 6**: Chạy testcase

    Mở Xcode -> **Product** -> **Test**

- **Bước 7**: Thiết lập tin cập cho app trên điện thoại

    Trên điện thoại vào mục **Cài đặt** -> **Cài đặt chung** -> **Quản lý thiết bị** -> Chọn app -> Chọn **Trust**

    https://user-images.githubusercontent.com/14148177/159929580-fdde3787-fe02-402a-8b3d-160872529848.MP4

### 14.1 Android

- **Step 1**: Pluggable USB Android

    ![image](https://user-images.githubusercontent.com/14148177/159932365-240196aa-32e3-439e-acbc-b3bb78acd73a.png)

- **Step 2**: Check java version should is **11**

    ```bash
    java --version
    ```
    
    <img width="1146" alt="image" src="https://user-images.githubusercontent.com/14148177/159934605-c46d4da3-4ce6-42af-92cf-e7d633d6b0bd.png">

- **Step 3**: Check gradle mapping with java 11

    Open Android Studio from <project_dir>/android -> Choose **File**  -> **Project Structure** -> **SDK Location** -> **Gradle settings** -> Java sdk

- **Step 4**: Build android

    Open Android Studio from <project_dir>/android -> Choose **Build** -> **Rebuild Project**

    > Waiting build successfully

- **Step 5**: Run test with specific environment and mode.

#### 14.1.1 development environment

##### 14.1.1.1 debug mode

```bash
make integration_test_real_device_android_dev_debug
```

##### 14.1.1.2 profile mode

```bash
make integration_test_real_device_android_dev_profile
```

##### 14.1.1.3 release mode

```bash
make integration_test_real_device_android_dev_release
```

#### 14.1.2 staging environment

##### 14.1.2.1 debug mode

```bash
make integration_test_real_device_android_staging_debug
```

##### 14.1.2.2 profile mode

```bash
make integration_test_real_device_android_staging_profile
```

##### 14.1.2.3 release mode

```bash
make integration_test_real_device_android_staging_release
```

#### 14.1.3 production environment

##### 14.1.3.1 debug mode

```bash
make integration_test_real_device_android_production_debug
```

##### 14.1.3.2 profile mode

```bash
make integration_test_real_device_android_production_profile
```

##### 14.1.3.3 release mode

```bash
make integration_test_real_device_android_production_release
```

## 15. Issues to keep in mind when running automation tests in the browser

- When performing automation testing on the browser, it will automatically run the script to open the terminal start driver and the terminal will automatically shut down when the automation test is finished running. But there will be a problem that the terminal will display a popup asking you to confirm to turn it off.

- As shown in the following illustration:

![image](https://user-images.githubusercontent.com/14148177/160526247-d54b77f2-f790-40b1-b9ec-81bbb55c8bb8.png)

- You can also disable this confirmation popup by doing the following:

- At **LaunchPad** -> Search "Terminal" -> Choose -> At **Terminal** -> Choose **Preferences** -> Choose Tab **Shell** -> Tab Label **Ask before closing** -> Choose **Never**

<img width="1020" alt="image" src="https://user-images.githubusercontent.com/14148177/160526422-42528e08-fba3-4725-b002-cb0f62c8e6e3.png">

## 16. Run automation test on chrome

- **Requirements**: Install browser [Chrome](https://www.google.com/chrome/)

### 16.1 development environment

#### 16.1.1 debug mode

```bash
make integration_test_web_chrome_dev_debug
```

#### 16.1.2 profile mode

```bash
make integration_test_web_chrome_dev_profile
```

#### 16.1.3 release mode

```bash
make integration_test_web_chrome_dev_release
```

### 16.2 staging environment

#### 16.2.1 debug mode

```bash
make integration_test_web_chrome_staging_debug
```

#### 16.2.2 profile mode

```bash
make integration_test_web_chrome_staging_profile
```

#### 16.2.3 release mode

```bash
make integration_test_web_chrome_staging_release
```

### 16.3 production environment

#### 16.3.1 debug mode

```bash
make integration_test_web_chrome_production_debug
```

#### 16.3.2 profile mode

```bash
make integration_test_web_chrome_production_profile
```

#### 16.3.3 release mode

```bash
make integration_test_web_chrome_production_release
```

## 17. Run automation test on firefox

- **Requirements**: Install [firefox](https://www.mozilla.org/en-US/firefox/new/)

### 17.1 development environment

#### 17.1.1 debug mode

```bash
make integration_test_web_firefox_dev_debug
```

#### 17.1.2 profile mode

```bash
make integration_test_web_firefox_dev_profile
```

#### 17.1.3 release mode

```bash
make integration_test_web_firefox_dev_release
```
### 17.2 staging environment

#### 17.2.1 debug mode

```bash
make integration_test_web_firefox_staging_debug
```

#### 17.2.2 profile mode

```bash
make integration_test_web_firefox_staging_profile
```

#### 17.2.3 release mode

```bash
make integration_test_web_firefox_staging_release
```

### 17.3 production environment

#### 17.3.1 debug mode

```bash
make integration_test_web_firefox_production_debug
```

#### 17.3.2 profile mode

```bash
make integration_test_web_firefox_production_profile
```

#### 17.3.3 release mode

```bash
make integration_test_web_firefox_production_release
```

## 18. Run automation test on safari

- **Requirements**: 
  
  - Install [safari](https://support.apple.com/downloads/safari)
  - Must have MacOS
  
### 18.1 development environment

#### 18.1.1 debug mode

```bash
make integration_test_web_safari_dev_debug
```

#### 18.1.2 profile mode

```bash
make integration_test_web_safari_dev_profile
```

#### 18.1.3 release mode

```bash
make integration_test_web_safari_dev_release
```
### 18.2 staging environment

#### 18.2.1 debug mode

```bash
make integration_test_web_safari_staging_debug
```

#### 18.2.2 profile mode

```bash
make integration_test_web_safari_staging_profile
```

#### 18.2.3 release mode

```bash
make integration_test_web_safari_staging_release
```

### 18.3 production environment

#### 18.3.1 debug mode

```bash
make integration_test_web_safari_production_debug
```

#### 18.3.2 profile mode

```bash
make integration_test_web_safari_production_profile
```

#### 18.3.3 release mode

```bash
make integration_test_web_safari_production_release
```

## 19. Run automation test on edge

- **Requirements**: 
  
  - Install [Edge](https://www.microsoft.com/en-us/edge)
  - Must have windows

## 20. Inspiration

[Bloc Library](https://bloclibrary.dev/#/)
[Flutter Gherkin](https://github.com/jonsamwell/flutter_gherkin/tree/integration_test__package_support)

## 21. Author

Phạm Minh Hải Âu

## 22. Contributing

Pull requests are always welcome! Feel free to open a new GitHub issue for any changes that can be made.

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://gist.github.com/MarcDiethelm/7303312)

## 23. Documentation

[Flutter Flavors](https://docs.flutter.dev/deployment/flavors)

## 24. Thanks

[Flutter Gherkin used integration test](https://github.com/jonsamwell/flutter_gherkin/tree/integration_test__package_support)
[Generate icon app](https://appicon.co/)
[Run test android buildTypes](https://stackoverflow.com/questions/31180173/espresso-junit-4-imports-are-not-getting-added-to-android-studio-project-migra)

