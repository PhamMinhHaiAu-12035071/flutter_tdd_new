# flutter_tdd_new
Đây là dự án viết test cho flutter theo kiến trúc BLoc pattern

# Mục lục
* [Yêu cầu](#yêu-cầu)
* [Trợ giúp](#trợ-giúp) 
* [Cài đặt](#cài-đặt)
* [Tái cấu trúc file](#tái-cấu-trúc-file)
* [Gỡ cài đặt](#gỡ-cài-đặt)
* [Chạy web server](#chạy-web-server)
* [Chạy trên web](#chạy-trên-web)
* [Chạy test](#chạy-test)
* [Chạy coverage](#chạy-coverage)
* [Chạy automation test trên thiết bị ảo](#chạy-automation-test-trên-thiết-bị-ảo)
  - [Trên IOS với android studio](#trên-ios-với-android-studio)
  - [Trên Android với android studio](#trên-android-với-android-studio)
* [Chạy automation test trên thiết bị thật](#chạy-automation-test-trên-thiết-bị-thật)
  - [Trên IOS với xcode](#trên-ios-với-xcode)
  - [Trên Android với android studio](#trên-android-với-android-studio)

## Yêu cầu

- Cài đặt [Nodejs](https://nodejs.org/en/)
- Cài đặt [Yarn](https://yarnpkg.com/)
- Cài đặt [Flutter](https://docs.flutter.dev/get-started/install)

## Trợ giúp

- Hiển thị danh sách các câu lệnh

```bash
make
```

- Demo

https://user-images.githubusercontent.com/14148177/159755038-85099a72-87ce-4efd-906a-6e9c62e38b5d.mov


## Cài đặt

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

## Chạy web server

- Khởi chạy nhanh flutter trên localhost server sẽ phải tự hot-reload thủ công

```bash
make web-server
```

- Demo

https://user-images.githubusercontent.com/14148177/159762209-5a73a706-81ec-403c-bbb7-e33f396bf8ed.mov

## Chạy trên web

- Khởi tạo flutter trên trình duyệt web (mặc định sử dụng trình duyệt chrome)

```bash
make web
```

- Demo

https://user-images.githubusercontent.com/14148177/159763330-20365063-1218-47c2-bff6-8c6c3611c4cb.mov

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

### Trên Android với android studio

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

- **Bước 6**: Chạy lệnh để test

    ```bash
    make integration_test_device
    ```

    <img width="1128" alt="image" src="https://user-images.githubusercontent.com/14148177/159924544-5d653da4-0f90-47ac-b7ff-82deaefc912f.png">

## Chạy automation test trên thiết bị thật

### Trên IOS với xcode

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



