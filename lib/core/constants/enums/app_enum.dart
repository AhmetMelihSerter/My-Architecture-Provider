enum AppMode {
  Debug,
  FakeService,
  Release,
}

enum AppThemes {
  Light,
  Dark,
}

enum ImageEnum {
  Logo,
  Home,
}

extension ImageEnumExtension on ImageEnum {
  String get path {
    switch (this) {
      case ImageEnum.Home:
        return 'assets/icon/ic_home.png';
      default:
        return 'assets/logo/logo.png';
    }
  }
}
