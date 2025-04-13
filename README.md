# Mazaady Task – Profile & Language Screens

This project is built using the MVC design pattern and includes proper structure, clean separation of concerns, and UI/UX enhancements using external libraries and custom components. The app is also fully localized and well-organized for scalability and maintainability.

## 🗂 Project Structure

### 📡 Network
Modular and reusable network layer.

```
Network/
├── ImageLoad.swift         # Centralized image loading with optional loader
├── Loader.swift            # Custom loader implementation
├── NetworkManager.swift    # Handles all network requests
```

### 🧠 MVC

#### 🌐 Language
The Language screen controller.

```
MVC/
└── Language/
    └── Controller/
        └── ChangeLanguageVC.swift
```

#### 👤 Profile
Handles the Profile screen including ads, products, and tags.

```
MVC/
└── Profile/
    ├── Model/
    │   ├── AdvertisementModel.swift
    │   ├── ProductsModel.swift
    │   ├── TagsModel.swift
    │   └── UserModel.swift
    │
    ├── View/
    │   ├── Customs/
    │   │   └── CustomSegmentControlDelegate.swift   # Custom segmented control
    │   ├── Files/
    │   │   ├── AdsCVC.swift
    │   │   ├── ProductsCVC.swift
    │   │   └── TagsCVC.swift
    │   └── XIB/
    │       ├── Ads.xib
    │       ├── Products.xib
    │       └── Tags.xib
    │
    └── Controller/
        ├── ProfileCollections.swift   # Separated using extensions
        └── ProfileVC.swift            # Main controller
```

## 🎨 Design

- Used a third-party library to improve the design
- All colors are defined inside the `Assets` folder
- Centralized and reusable image loading functionality
- Custom segmented control UI and styled tab bar
- UI components built using `.xib` files for modularity and reuse

## 🌍 Localization

- App fully supports localization
- Language switch functionality built using `ChangeLanguageVC.swift`

## ✅ Clean Code Practices

- ViewControllers separated using extensions
- Clear MVC architecture
- Folder separation for better organization

## ✨ Author

Aya Baghdadi
