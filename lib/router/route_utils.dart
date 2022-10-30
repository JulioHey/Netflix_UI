enum Pages { splashScreen, login, chosseProfile }

extension PagesExtension on Pages {
  String get toPath {
    switch (this) {
      case Pages.splashScreen:
        return "/loading";
      case Pages.login:
        return "/login";
      case Pages.chosseProfile:
        return "/chosseProfile";
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
      case Pages.chosseProfile:
        return "CHOOSEPROFILE";
      default:
        return "";
    }
  }
}
