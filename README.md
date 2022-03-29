# flutter_tdd_new
Đây là dự án viết test cho flutter theo kiến trúc BLoc pattern

# Mục lục
* [Tính năng](#tính-năng)
* [Cấu trúc dự án](#cấu-trúc-dự-án)  
* [Yêu cầu](#yêu-cầu)
* [Trợ giúp](#trợ-giúp) 
* [Cài đặt](#cài-đặt)
* [Tái cấu trúc file](#tái-cấu-trúc-file)
* [Gỡ cài đặt](#gỡ-cài-đặt)
* [Chạy trên thiết bị ảo](#chạy-trên-thiết-bị-ảo)
  - [Trên Android](#trên-android)
    * [Với môi trường development](#với-môi-trường-development)
      - [Với chế độ debug](#với-chế-độ-debug)
      - [Với chế độ profile](#với-chế-độ-profile)
      - [Với chế độ release](#với-chế-độ-release)
    * [Với môi trường staging](#với-môi-trường-staging)
    * [Với môi trường production](#với-môi-trường-production)
* [Chạy web server](#chạy-web-server)
  - [Web server với môi trường development](#web-server-với-môi-trường-development)
  - [Web server với môi trường staging](#web-server-với-môi-trường-staging)
  - [Web server với môi trường production](#web-server-với-môi-trường-production)
* [Chạy trên web](#chạy-trên-web)
  - [Web với môi trường development](#web-với-môi-trường-development)
  - [Web với môi trường staging](#web-với-môi-trường-staging)
  - [Web với môi trường production](#web-với-môi-trường-production)
* [Chạy test](#chạy-test)
* [Chạy coverage](#chạy-coverage)
* [Chạy automation test trên thiết bị ảo](#chạy-automation-test-trên-thiết-bị-ảo)
  - [Trên IOS với android studio](#trên-ios-với-android-studio)
  - [Trên android](#trên-android)
    - [Cài đặt với android studio](#cài-đặt-với-android-studio)
    * [Automation test android với môi trường development](#automation-test-android-với-môi-trường-development)
      - [Automation test android với chế độ debug](#automation-test-android-với-chế-độ-debug)
      - [Automation test android với chế độ profile](#automation-test-android-với-chế-độ-profile)
      - [Automation test android với chế độ release](#automation-test-android-với-chế-độ-release)
* [Chạy automation test trên thiết bị thật](#chạy-automation-test-trên-thiết-bị-thật)
  - [Trên IOS thật với xcode](#trên-ios-thật-với-xcode)
  - [Trên Android thật với android studio](#trên-android-thật-với-android-studio)
* [Vấn đề cần lưu ý khi chạy automation test trên trình duyệt](#Vấn-đề-cần-lưu-ý-khi-chạy-automation-test-trên-trình-duyệt)  
* [Chạy automation test trên chrome](#chạy-automation-test-trên-chrome)
  - [Automation test chrome với môi trường development](#automation-test-chrome-với-môi-trường-development)
    * [Automation test chrome với chế độ debug](#automation-test-chrome-với-chế-độ-debug)
    * [Automation test chrome với chế độ profile](#automation-test-chrome-với-chế-độ-profile)
    * [Automation test chrome với chế độ release](#automation-test-chrome-với-chế-độ-release)
* [Chạy automation test trên firefox](#chạy-automation-test-trên-firefox)
* [Chạy automation test trên safari](#chạy-automation-test-trên-safari)
  - [Automation test safari với môi trường development](#automation-test-safari-với-môi-trường-development)
    * [Automation test safari với chế độ debug](#automation-test-safari-với-chế-độ-debug)
    * [Automation test safari với chế độ profile](#automation-test-safari-với-chế-độ-profile)
    * [Automation test safari với chế độ release](#automation-test-safari-với-chế-độ-release)
* [Chạy automation test trên edge](#chạy-automation-test-trên-edge)
* [Cảm hứng](#cảm-hứng)
* [Tác giả](#tác-giả)
* [Đóng góp](#đóng-góp)
* [Tài liệu](#tài-liệu)
* [Cám ơn](#cám-ơn)

## Tính năng

- Sử dụng kiến trúc BLoC dễ dàng maintained
- Hỗ trợ unit test
- Hỗ trợ integration test

## Cấu trúc dự án

    .    
    ├── integration_test                                 # Thư mục automation test
    ├── ios                                              # Thư mục chứa native code ios
    ├── android                                          # Thư mục chứa native code android
    ├── lib                                              # Thư mục dự án
    |   ├── configs                                      # Thư mục chứa cấu hình và định tuyến
    |   ├── constants                                    # Thư mục chứa các biến hằng số dùng chung
    |   ├── modules                                      # Thư mục chứa tất cả tính năng của ứng dụng
    |   ├── shared                                       # Thư mục chứa các tính năng, widgets, ... có thể sử dụng chung
    |   ├── utilities                                    # Thư mục chứa các methods, class hỗ trợ
    ├── scripts                                          # Thư mục chứa các file bash shell để cấu hình
    ├── test                                             # Thư mục chứa unit-test
    ├── test_driver                                      # Thư mục chứa driver test hỗ trợ automation test
    ├── web                                              # Thư mục chứa code web
    ├── windows                                          # Thư mục chứa code cho desktop app windows
    ├── analysis_options.yaml                            # Tập tin chứa settings cho lint code
    ├── build.yaml                                       # Tập tin chứa settings generate cho gherkin
    ├── lefthook.yml                                     # Tập tin chạy các git-hook để kiểm tra lint-code và test
    ├── Makefile                                         # Tập tin chạy các lệnh nhanh 
    └── README.md                                        # Tập tin tài liệu

## Yêu cầu

- Cài đặt [Nodejs](https://nodejs.org/en/)
- Cài đặt [Yarn](https://yarnpkg.com/)
- Cài đặt [Flutter](https://docs.flutter.dev/get-started/install)
- Cài đặt [Java 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)

## Trợ giúp

- Hiển thị danh sách các câu lệnh

```bash
make
```

- Demo

https://user-images.githubusercontent.com/14148177/159755038-85099a72-87ce-4efd-906a-6e9c62e38b5d.mov


## Cài đặt

- Tương thích trên node phiên bản 14.
- Cài đặt package.json
- Cài đặt pubspec.yaml
- Thiết lập phân quyền cho file script

```bash
make install
```

- Demo

https://user-images.githubusercontent.com/14148177/159755689-a04a92e0-f7c8-45c6-beb2-c83f7cc35f3c.mov

## Tái cấu trúc file

- Xây dựng lại file json_serializable
- Xây dựng lại file test

```bash
make rebuild
```

- Demo

https://user-images.githubusercontent.com/14148177/159757631-61008afa-addc-4f5e-b779-808001dc17f1.mov

## Gỡ cài đặt

- Xoá node_modules
- Xoá cache pub
- Xoá các file generated

```bash
make clean
```

- Demo

https://user-images.githubusercontent.com/14148177/159760474-fc1d8d36-a9db-441c-bd27-cab93b80502a.mov

> Lưu ý: Nên chạy lại **make install** để cài đặt lại

## Chạy trên thiết bị ảo

### Trên Android

#### Với môi trường development

##### Với chế độ debug

- Chạy code trên thiết bị ảo với môi trường **development** và chế độ **debug**

```bash
make emulator-dev-debug
```

##### Với chế độ profile

- Chạy code trên thiết bị ảo với môi trường **development** và chế độ **profile**

- **Yêu cầu**:
  - Thiết bị ảo trên android phải hỗ trợ instruction: **arm64-v8a**
  - Bạn có thể kiểm tra xem thử điện thoại có hỗ trợ **arm64-v8a** hay không bằng cách sử dụng phần mềm thứ 3 **Device Info**

```bash
make emulator-dev-profile
```

##### Với chế độ release

- Chạy code trên thiết bị ảo với môi trường **development** và chế độ **release**

- **Yêu cầu**:
  - Thiết bị ảo trên android phải hỗ trợ instruction: **arm64-v8a**
  - Bạn có thể kiểm tra xem thử điện thoại có hỗ trợ **arm64-v8a** hay không bằng cách sử dụng phần mềm thứ 3 **Device Info**
  
```bash
make emulator-dev-release
```

#### Với môi trường staging

#### Với môi trường production


## Chạy web server

- Khởi chạy nhanh flutter trên localhost server sẽ phải tự hot-reload thủ công

### Web server với môi trường development

```bash
make web-server-dev
```

### Web server với môi trường staging

```bash
make web-server-stg
```

### Web server với môi trường production

```bash
make web-server-prod
```

## Chạy trên web

- Khởi tạo flutter trên trình duyệt web (mặc định sử dụng trình duyệt chrome)

### Web với môi trường development

- Link tham khảo [web-renderers](https://docs.flutter.dev/development/tools/web-renderers)

```bash
make web-dev
```

### Web với môi trường staging

- Link tham khảo [web-renderers](https://docs.flutter.dev/development/tools/web-renderers)

```bash
make web-stg
```

### Web với môi trường production

- Link tham khảo [web-renderers](https://docs.flutter.dev/development/tools/web-renderers)

```bash
make web-prod
```

## Chạy test

- Chạy unit-test

```bash
make test
```

<img width="1158" alt="image" src="https://user-images.githubusercontent.com/14148177/159906201-f7297d8b-0c46-4bb4-8493-f9268e2df481.png">

## Chạy coverage

- Chạy coverage để kiểm tra độ bao phủ của testcase

<img width="1161" alt="image" src="https://user-images.githubusercontent.com/14148177/159906548-fbbad180-d3de-4fd1-a5c9-bb4ca2538dda.png">

## Chạy automation test trên thiết bị ảo

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

### Trên android

#### Cài đặt với android studio

- **Đề nghị**: nên cài đặt [Genymotion](https://www.genymotion.com/) và [Virtualbox](https://www.virtualbox.org/) để chạy máy ảo nhanh hơn

- **Bước 1**: Thay đổi view toolbar

    Mở Android Studio -> **View** -> **Appearance** -> **Toolbar**

    https://user-images.githubusercontent.com/14148177/159922224-9cddbcac-b693-4d63-bc12-9029db203121.mov

- **Bước 2**: Cài đặt plugin Genymotion

    Mở Android Studio -> **Preferences** -> **Plugins** -> Gõ "Genymotion" -> **Install**
    
    https://user-images.githubusercontent.com/14148177/159922981-536e0563-1fd0-44e7-8a43-c417feccabba.mov

- **Bước 3**: Thiết lập đường dẫn đến ứng dụng Genymotion

    Mở Android Studio -> **Preferences** -> Gõ "Genymotion" -> **Genymotion Plugin** -> Nhập đường dẫn đến ứng dụng genymotion **/Applications/Genymotion.app**
    
    https://user-images.githubusercontent.com/14148177/159923778-14b7fa4d-2dc8-46d5-a03e-b889c5e7254d.mov

- **Bước 4**: Khởi động thiết bị ảo Android

    Nhấn icon 'Genymotion' -> Chọn thiết bị -> **Start**
    
    https://user-images.githubusercontent.com/14148177/159924240-0835496b-106d-4cb8-b214-3bd5e7ee5e17.mov

- **Bước 5**: Chờ thiết bị khởi động thành công

    <img width="550" alt="image" src="https://user-images.githubusercontent.com/14148177/159924425-c132fdee-93a5-4358-b4ae-bdf593d9ce4b.png">

- **Bước 6**: Chạy lệnh để test theo hướng dẫn cho từng thiết bị và môi trường tương ứng.

#### Automation test android với môi trường development

##### Automation test android với chế độ debug

- Chạy automation test trên android với môi trường **development** và chế độ **debug**

```bash
make integration_test_device_dev_debug
```

##### Automation test android với chế độ profile

- Chạy automation test trên android với môi trường **development** và chế độ **profile**

- **Yêu cầu**:
  - Thiết bị ảo trên android phải hỗ trợ instruction: **arm64-v8a**
  - Bạn có thể kiểm tra xem thử điện thoại có hỗ trợ **arm64-v8a** hay không bằng cách sử dụng phần mềm thứ 3 **Device Info**
  
```bash
make integration_test_device_dev_profile
```

##### Automation test android với chế độ release

- Không hỗ trợ chạy automation test ở chế độ **release**

## Chạy automation test trên thiết bị thật

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
   
    https://user-images.githubusercontent.com/14148177/159928831-374eee28-73e3-41f9-ac22-ef4cf1945cf5.mov

- **Bước 7**: Thiết lập tin cập cho app trên điện thoại

    Trên điện thoại vào mục **Cài đặt** -> **Cài đặt chung** -> **Quản lý thiết bị** -> Chọn app -> Chọn **Trust**

    https://user-images.githubusercontent.com/14148177/159929580-fdde3787-fe02-402a-8b3d-160872529848.MP4

### Trên Android thật với android studio

- **Bước 1**: Cắm USB kết nối đến thiết bị Android

    ![image](https://user-images.githubusercontent.com/14148177/159932365-240196aa-32e3-439e-acbc-b3bb78acd73a.png)

- **Bước 2**: Kiểm tra phiên bản java phải là **11**

    ```bash
    java --version
    ```
    
    <img width="1146" alt="image" src="https://user-images.githubusercontent.com/14148177/159934605-c46d4da3-4ce6-42af-92cf-e7d633d6b0bd.png">

- **Bước 3**: Kiểm tra gradle mapping đúng phiên bản java 11

    Mở Android Studio từ thư mục <project_dir>/android -> Chọn **File**  -> **Project Structure** -> **SDK Location** -> **Gradle settings** -> Java sdk
    
    https://user-images.githubusercontent.com/14148177/159935588-f8d7ce73-df58-42d6-826f-85276894bfda.mov

- **Bước 4**: Build android

    Mở Android Studio từ thư mục <project_dir>/android -> Chọn **Build** -> **Rebuild Project**
    
    https://user-images.githubusercontent.com/14148177/159936106-9d337ee9-9959-49f1-8df3-83f4a11ee6fe.mov
    
    > Đảm bảo rằng việc build là thành công

- **Bước 5**: Chạy lệnh test

    ```bash
    make integration_test_real_device_android
    ```

    <img width="1147" alt="image" src="https://user-images.githubusercontent.com/14148177/159936977-121ba0ce-b10b-4fac-aa6f-65f1980b8816.png">

## Vấn đề cần lưu ý khi chạy automation test trên trình duyệt

- Khi thực hiện automation test trên trình duyệt sẽ tự động chạy script để mở terminal start driver và terminal sẽ tự động tắt khi automation test chạy xong. Nhưng sẽ có một vấn đề là terminal sẽ hiển thị popup bắt bạn phải xác nhận để tắt.

- Như hình ví dụ minh họa sau:

![image](https://user-images.githubusercontent.com/14148177/160526247-d54b77f2-f790-40b1-b9ec-81bbb55c8bb8.png)

- Bạn cũng có thể tắt chức năng mở popup xác nhận này bằng cách như sau:

- Tại **LaunchPad** -> Search "Terminal" -> Chọn -> Tại **Terminal** -> Chọn **Preferences** -> Chọn Tab **Shell** -> Tại Label **Ask before closing** -> Chọn **Never**

<img width="1020" alt="image" src="https://user-images.githubusercontent.com/14148177/160526422-42528e08-fba3-4725-b002-cb0f62c8e6e3.png">

## Chạy automation test trên chrome

- **Yêu cầu**: Phải cài đặt trình duyệt [Chrome](https://www.google.com/chrome/)

### Automation test chrome với môi trường development

#### Automation test chrome với chế độ debug

```bash
make integration_test_web_chrome_dev_debug
```

#### Automation test chrome với chế độ profile

```bash
make integration_test_web_chrome_dev_profile
```

#### Automation test chrome với chế độ release

```bash
make integration_test_web_chrome_dev_release
```

## Chạy automation test trên firefox

- **Yêu cầu**: Phải cài đặt trình duyệt firefox

```bash
make integration_test_web_firefox
```

<img width="1147" alt="image" src="https://user-images.githubusercontent.com/14148177/159938659-1ad20ae0-d9f5-4355-a324-92cb6c1c9e71.png">

## Chạy automation test trên safari

- **Yêu cầu**: 
  
  - Phải cài đặt trình duyệt [safari](https://support.apple.com/downloads/safari)
  - Phải có máy MacOS
  
### Automation test safari với môi trường development

#### Automation test safari với chế độ debug

```bash
make integration_test_web_safari_dev_debug
```

#### Automation test safari với chế độ profile

```bash
make integration_test_web_safari_dev_profile
```

#### Automation test safari với chế độ release

```bash
make integration_test_web_safari_dev_release
```

## Chạy automation test trên edge

- **Yêu cầu**: Phải cài đặt trình duyệt edge

- Cần thiết bị window để kiểm tra -> **Chưa kiểm tra trường hợp này**

## Cảm hứng

[Bloc Library](https://bloclibrary.dev/#/)
[Flutter Gherkin](https://github.com/jonsamwell/flutter_gherkin/tree/integration_test__package_support)

## Tác giả

Phạm Minh Hải Âu

## Đóng góp

Pull request luôn được chào đón! Hãy thoải mái mở một new issues GitHub cho bất kỳ thay đổi nào có thể được thực hiện. 

## Tài liệu

[Flutter Flavors](https://docs.flutter.dev/deployment/flavors)

## Cám ơn

[Flutter Gherkin used integration test](https://github.com/jonsamwell/flutter_gherkin/tree/integration_test__package_support)
[Generate icon app](https://appicon.co/)
[Run test android buildTypes](https://stackoverflow.com/questions/31180173/espresso-junit-4-imports-are-not-getting-added-to-android-studio-project-migra)

