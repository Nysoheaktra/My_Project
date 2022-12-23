import 'dart:convert';

import 'package:app_commerce/model/user.dart';
import 'package:app_commerce/service/local_server/local_auth_server.dart';
import 'package:app_commerce/service/remote_service/remote_auth_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  final LocalAuthServer _localAuthServer = LocalAuthServer();

  @override
  void onInit() async {
    await _localAuthServer.init();

    super.onInit();
  }

  void signUp(
      {required String fullname,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loadiing....',
        dismissOnTap: false,
      );
      var result = await RemoteAuthUserService()
          .signUp(email: email, password: password);
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthUserService()
            .createProfile(fullname: fullname, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthServer.addToken(token: token);
          await _localAuthServer.addUser(user: user.value!);
          EasyLoading.showSuccess('Welcome to MyGrocery');
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something went wrong...2');
        }
      } else {
        EasyLoading.showError('Something went wrong...3');
      }
    } catch (e) {
      EasyLoading.showError('Something went wrong...1');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthServer.clear();
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loadiing....',
        dismissOnTap: false,
      );
      var result = await RemoteAuthUserService()
          .signUp(email: email, password: password);
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthUserService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthServer.addToken(token: token);
          await _localAuthServer.addUser(user: user.value!);
          EasyLoading.showSuccess('Welcome to MyGrocery');
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something went wrong...2');
        }
      } else {
        EasyLoading.showError('User name and password have been already');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something went wrong...1');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
