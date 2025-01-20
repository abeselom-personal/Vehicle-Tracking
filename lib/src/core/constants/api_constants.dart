class ApiConstants {
  /// Base URLs for the API
  static const String baseUrl = 'https://your-base-url/';
  static const String databaseUrl = '$baseUrl/api/';
  static const String storageUrl = '$baseUrl/storage/';

  /// Other API constants
  static const String loginUrl = '$databaseUrl/login';
  static const String signupUrl = '$databaseUrl/signup';
}