part of 'startup_top.dart';

class Startup {
  static final Startup _instance = Startup._internal();

  static Startup get instance => _instance;

  Startup._internal();

  static final locator = GetIt.instance;

  Future<void> initialize() async {
    await dotenv.load(fileName: ".env");
    await Hive.initFlutter();

    /// Manager initialization
    _manager();

    /// Service initialization
    _commonService();

    if (ApplicationConstants.appMode == AppMode.FakeService) {
      _fakeService();
    } else {
      _service();
    }

    /// ViewModel initialization
    _viewModel();

    /// First initialization should always be ISecureManager
    await locator<ISecureManager>().initialize();
    await locator<ILocalManager>().initialize();
  }

  void _manager() {
    /// Logger Manager
    locator.registerLazySingleton<ILoggerManager>(() => LoggerManager());

    /// Navigator Service and Router
    locator
        .registerLazySingleton<INavigationService>(() => NavigationService());
    locator.registerLazySingleton<NavigationRouter>(() => NavigationRouter());

    /// Network Manager
    /// Two Singletons Name
    final vexanaManager = VexanaManager();
    locator.registerLazySingleton<INetworkManager>(() => vexanaManager);
    locator.registerLazySingleton<ICoreNetworkManager>(() => vexanaManager);

    /// Local Manager
    locator.registerLazySingleton<ILocalManager>(() => HiveManager());

    /// Secure Manager
    locator.registerLazySingleton<ISecureManager>(() => SecureStorage());

    /// Theme Manager
    locator.registerLazySingleton<IThemeManager>(() => ThemeManager());

    /// Language Manager
    locator.registerLazySingleton<LanguageManager>(() => LanguageManager());
  }

  void _commonService() {
    locator.registerFactory<NoService>(() => NoService());
  }

  void _service() {
    /// Service
    locator.registerLazySingleton<ILoginService>(() => LoginService());
    locator.registerLazySingleton<IHomeService>(() => HomeService());
  }

  void _fakeService() {
    /// Fake Service
    locator.registerLazySingleton<ILoginService>(() => FakeLoginService());
    locator.registerLazySingleton<IHomeService>(() => FakeHomeService());
  }

  void _viewModel() {
    /// View Model
    locator.registerLazySingleton<OnboardViewModel>(() => OnboardViewModel());
    locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
    locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  }
}
