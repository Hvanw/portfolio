# portfolio

My Flutter Porrfolio Showcases App

## Basic Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Configs and scripts
Usage:
```
$ dart run 
```
## TODO
[ ] Gen firebase configs

## Structure
lib/
├── main.dart             # Khởi tạo ứng dụng & cung cấp RouterConfig

├── presentation/         # Lớp Giao diện (Presentation Layer)
│   
│   ├── router/           # Cấu hình Router Toàn cục
│   │   └── app_router.dart   # Định nghĩa tất cả GoRoute
│   
│   ├── shared/           # Các thành phần dùng chung toàn ứng dụng
│   │   ├── widgets/
│   │   │   ├── app_scaffold.dart     # Widget Scaffold cơ bản, Footer/Header chung
│   │   │   └── loading_indicator.dart
│   │   └── config/       # Cấu hình Theme, Constants
│
│   ├── home/             # FEATURE: Màn hình chính
│   │   ├── home_page.dart            # Page chính (Nơi chứa OrientationBuilder)
│   │   ├── widgets/      # Widgets chỉ dùng trong Home
│   │   │   ├── home_content_portrait.dart  # Giao diện dọc (Giới hạn 3 Projects)
│   │   │   └── home_content_landscape.dart # Giao diện ngang (Hiển thị tất cả Projects)
│   │   └── bloc/         # Logic quản lý trạng thái cho Home (nếu cần)
│   
│   ├── projects/         # FEATURE: Danh sách & Chi tiết Projects
│   │   ├── pages/
│   │   │   ├── projects_list_page.dart   # Màn hình List Projects (dùng cho nút "See all")
│   │   │   └── project_detail_page.dart  # Màn hình Chi tiết Project
│   │   └── widgets/
│   │       └── project_card.dart       # Widget Card tái sử dụng (dùng ở cả Home và List)
│
│   └── settings/         # FEATURE: Cài đặt (và các Pages đơn giản khác)
│       └── settings_page.dart
│
└── domain/               # Lớp Nghiệp vụ (Model, UseCase, Repository Interface)
    └── projects/
        └── project_entity.dart # Định nghĩa Project Data
