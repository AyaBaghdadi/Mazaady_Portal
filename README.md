
# 🧭 Mazaady iOS App – Custom UI with MVC Architecture

This project is built using Swift and follows the **MVC (Model-View-Controller)** architecture. It focuses on clean code organization, reusable components, localization, and enhanced design using custom UI.

---

## ✨ Features Overview

- 🎨 Custom `UISegmentedControl` with underline animation
- 🧭 Custom `UITabBar` with a centered rounded item and dynamic color handling
- 🌍 **Localization support** for multi-language (e.g., Arabic/English)
- 🧩 UI design enhanced using external library for components and animation
- 🖼 Reusable image loading method with optional loader control
- 📲 Dynamic product list using `UICollectionView` with custom `.xib` cells

---

## 🗂 Project Structure (MVC Pattern)

```
├── Models
│   └── Product.swift
│
├── Views
│   ├── Components
│   │   ├── UnderlineSegmentedControl.swift
│   │   ├── CustomTabBar.swift
│   │   └── LoaderView.swift
│   ├── Cells
│   │   └── ProductCVC.xib
│
├── Controllers
│   ├── Profile
│   │   └── ProfileViewController.swift
│   ├── Language
│   │   └── LanguageViewController.swift
│
├── Extensions
│   ├── UIViewController+Ext.swift
│   └── UIImageView+LoadImage.swift
│
├── Network
│   ├── APIService.swift
│   ├── Endpoints.swift
│   └── NetworkConstants.swift
```

---

## 📐 UI/UX Enhancements

- All colors are defined and managed in `Assets.xcassets` using semantic names like `color_main`, `color_text`, etc.
- Used a **design enhancement library** to improve layout and animation (e.g., `IBAnimatable` or similar)
- Reusable loader component (`LoaderView.swift`) that can be triggered optionally from image loading or API calls

---

## 🌍 Localization

- Full localization support using `.strings` files
- Dynamic language switching available inside the **Language** section
- Separated folder for language feature for easier maintenance

---

## 📤 Networking

- All networking logic separated in a dedicated folder
- Clean structure for:
  - `APIService` – core request logic
  - `Endpoints` – enum for all backend endpoints
  - `NetworkConstants` – base URL and other constants

---

## 🖼 Image Handling

- Custom `UIImageView` extension with the following method:

```swift
imageView.loadImage(from: url, showLoader: true)
```

- Automatically handles optional loader and async image caching

---

## 🧩 Custom Components

### 🔘 UnderlineSegmentedControl

- Inherits from `UISegmentedControl`
- Adds an underline to indicate selected segment
- Uses clear background and custom color attributes

### 🧭 CustomTabBar

- Includes 5 items:
  - Items 1, 2, 4, 5 have icon + label
  - Center item (item 3) is icon only, rounded, and colored with `color_main`

---

## 🧪 Tech Stack

- Swift
- UIKit
- MVC Pattern
- Storyboards + `.xib`
- Auto Layout
- Localization
- External UI Library (for design)
- URLSession / Codable

---

## 🧑‍💻 Developer

Built with ❤️ by **Aya Baghdadi**  
- Organized.
- Localized.
- Clean MVC.
- UI-focused.

---
