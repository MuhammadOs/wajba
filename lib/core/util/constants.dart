import 'package:wajba/features/Cart/data/cart_item_class.dart';

class AppConstants {
  static const appName = "Wajbah";
  static const appNameLower = "wajbah";

  // shared preference keys
  static const tokenKey = "token";
  static const timelineKey = "timeline";

  // cart meals
  static const List<CartItem> cartMeals = [];

  // end points
  static const baseUrl = "https://wajbahapi.azurewebsites.net/api";
  static const registerUrl = "/UserAuth/register";
  static const loginUrl = "/UserAuth/login";
  static const logOutUrl = "/logout";
}

class RegularExpressions {
  static final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])' // At least one lowercase letter
    r'(?=.*[A-Z])' // At least one uppercase letter
    r'(?=.*\d)' // At least one digit
    r'(?=.*[\W_])' // At least one special character (symbol)
    r'.{8,}', // Minimum length of 8 characters
  );
}
