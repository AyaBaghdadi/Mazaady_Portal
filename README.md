
# 📱 Mazaady Task – README

## 🚀 Overview
This task is a mini iOS app following the **MVC architecture**, focused on the **Profile** and **Language** pages.

---

## 🧩 Features
- 🌐 Multi-language support (Localization)
- 🧍 Profile page displaying:
  - User information
  - Tags
  - Advertisements
  - Products with countdown timer
- ⏳ Countdown timer with live update (D, H, M)
- 🖼 Unified image loading with optional loader
- ⏳ Custom loader for network states
- 🧩 Reusable `UICollectionViewCell`s using `.xib` files
- 🎛 Custom `UISegmentedControl` with underline style
- 📲 Modular and scalable file structure

---

## 📁 Project Structure

```
Mazaady/
│
├── Network/
│   ├── ImageLoad.swift
│   ├── Loader.swift
│   └── NetworkManager.swift
│
├── MVC/
│   ├── Language/
│   │   └── Controller/
│   │       └── ChangeLanguageVC.swift
│   │
│   └── Profile/
│       ├── Model/
│       │   ├── AdvertisementModel.swift
│       │   ├── ProductsModel.swift
│       │   ├── TagsModel.swift
│       │   └── UserModel.swift
│       │
│       ├── View/
│       │   ├── Customs/
│       │   │   └── CustomSegmentControlDelegate.swift
│       │   ├── Files/
│       │   │   ├── AdsCVC.swift
│       │   │   ├── ProductsCVC.swift
│       │   │   └── TagsCVC.swift
│       │   └── XIB/
│       │       ├── Ads.xib
│       │       ├── Products.xib
│       │       └── Tags.xib
│       │
│       └── Controller/
│           ├── ProfileVC.swift
│           └── ProfileCollections.swift
```

---

## 🧠 Technologies & Tools

- **UIKit**
- **XIBs**
- **MVC Architecture**
- **UserDefaults** for language saving
- **Timer** for countdown
- **Localization** with `.strings`
- **Custom Views and Loaders**

---

## 📝 Notes

- Colors are stored in the `Assets` folder.
- `ImageLoad.swift` handles all image loading logic.
- Countdown timer logic updates Days, Hours, and Minutes every second.
- Localization support via `UserDefaults` + reloading the view.
- Each `ViewController` is separated using extensions for clean code.
