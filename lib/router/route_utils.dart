enum Pages { splashScreen, login }

extension PagesExtension on Pages {
  String get toPath {
    switch (this) {
      case Pages.splashScreen:
        return "/loading";
      case Pages.login:
        return "/login";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case Pages.splashScreen:
        return "LOADING";
      case Pages.login:
        return "LOGIN";
      default:
        return "";
    }
  }
}
