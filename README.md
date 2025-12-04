# Union Shop — Flutter Coursework

This repository contains a Flutter application that recreates the Student Union e-commerce website ([shop.upsu.net](https://shop.upsu.net)) for coursework in the Programming Applications and Programming Languages (M30235) and User Experience Design and Implementation (M32605) modules at the University of Portsmouth.

---

## Features

- **Homepage** with a product carousel
- **Navigation bar** with responsive design and drawer menu
- **Product pages** with details, images, and "Add to Cart" functionality
- **Sale, Clothing, Merchandise, and Personalisation pages** with filtering, sorting, and pagination
- **Shopping cart**: add products, view basket, and see item count update in the navigation bar
- **Search functionality**: search for products by name, including personalised items
- **Footer** with opening hours, help links, offers, and email subscription
- **About Us page** with company information
- **Responsive layout** for mobile and desktop views
- **Widget tests** for all main pages and components (see `/test` directory)

---

## Getting Started

### Prerequisites

You have three options for your development environment:

1. **Firebase Studio** (browser-based, no installation required)
2. **University Windows computers** (via AppsAnywhere)
3. **Personal computer** (Windows or macOS)

Below is a quick guide for how to run the application using different environments:

**Firebase Studio:**

- Access [idx.google.com](https://idx.google.com) with a personal Google account
- Create a new workspace (only needed for running )
- Clone your forked repository using the command palette

**University Computers:**

- Open [AppsAnywhere](https://appsanywhere.port.ac.uk/sso) and launch the following in the given order:
  - Git
  - Flutter And Dart SDK
  - Visual Studio Code

**Personal Windows Computer:**

- Install [Chocolatey package manager](https://chocolatey.org/install)
- Run in PowerShell (as Administrator):

  ```bash
  choco install git vscode flutter -y
  ```
- open Vscode and download the following:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Visual Studio Code](https://code.visualstudio.com/) or another IDE


**Personal macOS Computer:**

- Install [Homebrew package manager](https://brew.sh/)
- Run in Terminal:

  ```bash
  brew install --cask visual-studio-code flutter
  ```

After installation, verify your setup by running:

```bash
flutter doctor
```
this command check your enivronment and displays a report of the tatus of your flutter installation


### Installation

Clone your forked repository:

```bash
git https://github.com/MM674294/union_shop.git
cd union_shop
```

Install dependencies:

```bash
flutter pub get
```

### Running the App

To run the app in Chrome (recommended for web/mobile view):

```bash
flutter run -d chrome
```

Open Chrome DevTools and toggle device toolbar for mobile view.

---

## Project Structure

```
union_shop/
├── lib/
│   ├── main.dart
│   ├── custom_app_bar.dart
│   ├── product_page.dart
│   ├── sale_page.dart
│   ├── clothing_page.dart
│   ├── merchandise_page.dart
│   ├── personalisation_page.dart
│   ├── about_page.dart
│   ├── footer.dart
│   └── 
├── test/
│   ├── home_test.dart
│   ├── product_test.dart
│   ├── sale_page_test.dart
│   ├── clothing_page_test.dart
│   ├── merchandise_page_test.dart
│   ├── about_page_test.dart
│   └── footer_test.dart
├── assets/
│   └── images/
├── pubspec.yaml
└── README.md
```

---

## Testing

Widget tests are provided for all main pages and components.  
To run all tests:

```bash
flutter test
```

Tests use [`network_image_mock`](https://pub.dev/packages/network_image_mock) to mock network images.

---

## External Services

- No external services are integrated in this coursework version.  
  (Add details here if you integrate Firebase, authentication, or hosting.)

---

## Notes

- All product images are AI-generated images.
- The application focuses on functionality over exact visual design.
- The code is structured for clarity and maintainability, following best practices.

---

## Author

Coursework by MM674294 for University of Portsmouth modules M30235/M32605.

---

## License

This project is for educational use only.