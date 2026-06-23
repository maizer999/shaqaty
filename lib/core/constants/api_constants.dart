
class ApiUrls {
  // static const String base = "https://admin.shaqaty.com/api";

  static const String base = "http://127.0.0.1:8000/api";
  static const String slider = "$base/get-slider";
  static const String categories = "$base/get-categories";
  static const String featured = "$base/get-featured-section";
  static const String addAds = "$base/add-item";
  static const String login =  "$base/login";
  static const String items =  "$base/get-item";
  static const String cites =  "$base/area";
  static const String googleLogin = "$base/signup-with-google";

  // subscription / packages
  static const String getPackage = "$base/get-package";
  static const String paymentSettings = "$base/get-payment-settings";
  static const String assignFreePackage = "$base/assign-free-package";
  static const String paymentIntent = "$base/payment-intent";
}