import 'package:alfie/models/user.dart';
import 'package:alfie/services/users_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  UserProvider._privateConstructor();

  static Future<UserProvider> init() async {
    UserProvider provider = UserProvider._privateConstructor();
    await provider.refreshUser();
    return provider;
  }

  Future<void> refreshUser() async {
    _user = await UsersService.instance.getUser();
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    await UsersService.instance.updateUser(user);
    await refreshUser();
  }

  Future<void> updateToken(String? token) async {
    await UsersService.instance.updateToken(token);
    await refreshUser();
  }

  Future<void> setUserEmail(String email) async {
    await updateUser(user.copyWith(email: email, verified: false, loginCanCheck2FA: false));
  }

  Future<void> setUserAsVerified() async {
    await updateUser(user.copyWith(verified: true, loginCanCheck2FA: false));
  }

  Future<void> setUserCanCheck2FALogin(String email) async {
    await updateUser(user.copyWith(email: email, loginCanCheck2FA: true));
  }

  Future<void> resetUserCanCheck2FALogin() async {
    await updateUser(user.copyWith(loginCanCheck2FA: false));
  }

  Future<void> saveUserLoginData(String firstName, String lastName, String token) async {
    await updateUser(user.copyWith(
      firstName: firstName,
      lastName: lastName,
      loginCanCheck2FA: false,
      token: token,
    ));
  }

  Future<void> logout() async {
    await updateUser(user.copyWith(
      email: "",
      firstName: "",
      lastName: "",
      verified: false,
      loginCanCheck2FA: false,
      token: "",
    ));
  }

  bool isUserAuthenticated() {
    return _user.token != null && _user.token!.isNotEmpty;
  }

  String getUserAuthenticationToken() {
    return _user.token!;
  }
}
