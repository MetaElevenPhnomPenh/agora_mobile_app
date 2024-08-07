import 'package:agora/export.dart';

class AppEnv {
  /// Production Environment
  static const Map<String, dynamic> productionEnvironment = {
    BASE_URL: "",
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  /// Development Environment
  static const Map<String, dynamic> developmentEnvironment = {
    //BASE_URL: "http://192.168.160.165:3000",
    BASE_URL: "http://192.168.0.64:4000",
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  /// Staging Environment
  static const Map<String, dynamic> stagingEnvironment = {
    BASE_URL: "",
    DEEP_LINK: '',
    COPY_LINK: '',
  };

  static String baseUrl = FlavorConfig.instance!.variables[BASE_URL];
  static String deepLink = FlavorConfig.instance!.variables[DEEP_LINK];
  static String copyLink = FlavorConfig.instance!.variables[COPY_LINK];

  /// Three type of environment
  static const String PRODUCTION_LABEL_NAME = "Production";
  static const String DEVELOPMENT_LABEL_NAME = "Dev";
  static const String STAGING_LABEL_NAME = "Staging";

  /// Key variable
  static const String BASE_URL = "baseUrl";
  static const String DEEP_LINK = "deepLink";
  static const String COPY_LINK = "copyLink";
}
