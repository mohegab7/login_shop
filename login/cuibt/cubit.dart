import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Shop_app/login_model.dart';
import 'package:flutter_application_1/moduels/shop_app/login/cuibt/states.dart';
import 'package:flutter_application_1/shared/network/end_points.dart';
import 'package:flutter_application_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopingLoginCuibt extends Cubit<ShopLoginStates> {
  ShopingLoginCuibt() : super(ShopLoginintinalstate());
  static ShopingLoginCuibt get(context) => BlocProvider.of(context);

  late ShopLoginModel LoginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginloadingState());
    dio_helper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      LoginModel = ShopLoginModel.fromJson(value.data);
      print(LoginModel.message);
      emit(ShopLoginSuccessState(LoginModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changepassword() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility_off : Icons.visibility_outlined;
    emit(ShopChangePasswordState());
  }
}
