import 'package:flutter_application_1/models/Shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginintinalstate extends ShopLoginStates {}

class ShopLoginloadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  late final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  ShopLoginErrorState(this.error);

  final String error;
}

class ShopChangePasswordState extends ShopLoginStates {}
