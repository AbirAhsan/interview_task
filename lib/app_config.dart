class AppConfig {
  static const String appName = "Insurance";
  static const bool https = true;
  static const bool isLive = true;

  //configure this
  static const domainPath = "jsonplaceholder.typicode.com";

  //do not configure these below
  static const String protocol = "https://";
  static const String rawBaseUrl = "$protocol$domainPath";

  static const String developerCompanyUrl = "https://abirahsan.com";
}
