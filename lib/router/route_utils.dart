enum Pages { splashScreen }

extension PagesExtension on Pages {
  String get toPath {
    switch (this) {
      case Pages.splashScreen:
        return "/loading";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case Pages.splashScreen:
        return "LOADING";
      default:
        return "";
    }
  }
}
