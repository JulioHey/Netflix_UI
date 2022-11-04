enum Pages {
  splashScreen,
  login,
  chooseProfile,
  enter,
  editProfile,
  chooseLanguage,
  legendExibition
}

extension PagesExtension on Pages {
  String get toPath {
    switch (this) {
      case Pages.splashScreen:
        return "/loading";
      case Pages.login:
        return "/login";
      case Pages.chooseProfile:
        return "/chooseProfile";
      case Pages.enter:
        return "/enter";
      case Pages.editProfile:
        return "/edit";
      case Pages.chooseLanguage:
        return "/chooseLanguage";
      case Pages.legendExibition:
        return "/legendExibition";
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
      case Pages.chooseProfile:
        return "CHOOSEPROFILE";
      case Pages.enter:
        return "ENTER";
      case Pages.editProfile:
        return "EDITPROFILE";
      case Pages.chooseLanguage:
        return "CHOOSELANGUAGE";
      case Pages.legendExibition:
        return "LEGENDEXIBITION";
      default:
        return "";
    }
  }
}
