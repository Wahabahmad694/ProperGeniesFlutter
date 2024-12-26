// ignore_for_file: constant_identifier_names

class ApiEndPoints {
  static const String CUSTOMER_BASE_URL =
      'https://proper-genies-production.up.railway.app';

  static const String register = '/v1/register';
  static const String login = '/v1/signin';
  static const String forgotPassword = '/v1/forgot-password';
  static const String getProfile = '/v1/profile';

  static String getPropertyDetail({required String id}) => '/v1/properties/$id';

  static String adPropertyFav({required String id}) =>
      '/v1/properties/$id/favorite';

  static String deleteUser({required String userId}) =>
      '/v1/delete-user/$userId';
  static const String propertyListing = '/v1/properties/listing';
  static const String favListing = '/v1/properties/favorites';
  static const String requestValuation = '/v1/request-valuation/add';
  static const String contactUs = '/v1/contact-us/add';
  static const String OTPVerification = '/v1/verify-otp';
}
