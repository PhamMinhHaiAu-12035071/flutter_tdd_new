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

