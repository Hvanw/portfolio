# Automated Profile HTML Generation

## Overview

Hệ thống tự động generate các Profile chuyên biệt dưới định dạng HTML từ `complete-profile.md` (Source of Truth) và các file metadata YAML (`profiles/*.metadata.yaml`). 

Hệ thống sử dụng cơ chế **"Single Source of Truth"**: Mọi nội dung chính được quản lý trong file Markdown, sau đó được đồng bộ sang Metadata và build ra HTML.

## File Structure

```
dotfiles/
├── complete-profile.md             # Nguồn nội dung chính (Markdown)
├── profiles/                       # Thư mục chứa cấu trúc Profile
│   ├── mobile.metadata.yaml        # Metadata cho bản Mobile
│   ├── ios.metadata.yaml           # Metadata cho bản iOS
│   └── ...                         # Các bản chuyên biệt khác
├── template.html                   # Giao diện khung (Shell)
├── styles.css                      # CSS dùng chung
├── scripts/
│   ├── build-html.js               # Script build HTML từ Metadata & MD
│   └── sync-metadata.js            # Script đồng bộ dữ liệu từ MD sang Metadata
└── index.html                      # Trang Portal điều hướng (Root)
```

## Workflow: Cập nhật Nội dung

Để đảm bảo tất cả các Profile đều có nội dung mới nhất, hãy tuân thủ quy trình sau:

### Bước 1: Cập nhật Markdown
Chỉnh sửa `complete-profile.md` (Thêm dự án, kỹ năng, cập nhật số năm kinh nghiệm).

### Bước 2: Đồng bộ Metadata
Chạy script để tự động cập nhật các kỹ năng và dự án từ Markdown sang tất cả các file YAML trong thư mục `profiles/`.

```bash
node scripts/sync-metadata.js
```

### Bước 3: Build HTML
Build các Profile cụ thể. Kết quả sẽ được lưu vào `profiles/<tên_profile>/index.html`.

```bash
# Build bản Mobile
node scripts/build-html.js mobile

# Build bản Standard
node scripts/build-html.js standard

# Hoặc build tất cả (manual command)
node scripts/build-html.js mobile && node scripts/build-html.js standard ...
```

## Setup Instructions

### 1. Install Dependencies
```bash
npm install
```

### 2. Local Sync & Build
```bash
# Đồng bộ nội dung
node scripts/sync-metadata.js

# Build profile cụ thể
node scripts/build-html.js <profile_name>
```

## Metadata Structure

Metadata kiểm soát thông tin liên hệ và cách sắp xếp các section. Phần **Skills** và **Projects** sẽ được script `sync-metadata.js` tự động ghi đè từ Markdown.

### Header
Dùng để cấu hình thông tin cá nhân và mạng xã hội.
```yaml
header:
  name: "VĂN MINH HUY"
  title: "Software Engineer"
  contact:
    - icon: "📧"
      type: "email"
      value: "email@example.com"
      link: "mailto:email@example.com"
```

## Sections Mapping

| Markdown Section | Sync Target | Output |
|-----------------|-------------|--------|
| Professional Summary | (Direct Parse) | Rendered as text paragraphs |
| Technical Skills | Metadata YAML | Rendered as Skill Cards |
| Selected Mobile Projects | Metadata YAML | Rendered as Project Cards |
| Professional Experience | (Direct Parse) | Rendered as Timeline items |
| Key Achievements | (Direct Parse) | Rendered as Styled list |
| Education | (Direct Parse) | Rendered as Education items |

## Benefits

✅ **Single Source of Truth**: Chỉ cần sửa nội dung trong file Markdown.
✅ **Auto-Synchronization**: Không lo dữ liệu giữa các bản CV bị lệch nhau.
✅ **Modular Output**: Mỗi Profile nằm trong một thư mục riêng biệt với đầy đủ assets (HTML, CSS).
✅ **Portal Navigation**: Trang chủ tự động dẫn đến tất cả các bản CV đã build.

---
*Last updated: May 2026*
