class AppConfig {
  static String baseUrl = 'http://192.168.1.11:7004/api';
  String get LOGIN_API => '$baseUrl/user/login';
  String get SIGNUP_API => '$baseUrl/user/register';
  String get TITLE_API => '$baseUrl/user/titles';
  String get VALIDATE_TOKEN_API => '$baseUrl/user/validate-token';
  String get REQUEST_OTP_API => '$baseUrl/user/verify-account';
  String get VERIFY_OTP_API => '$baseUrl/user/verify';
}
