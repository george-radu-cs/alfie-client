import 'package:alfie/models/user.dart';
import 'package:alfie/repositories/users_repository.dart';

class UsersService {
  UsersService._privateConstructor();
  static final UsersService instance = UsersService._privateConstructor();

  static final UsersRepository _usersRepository = UsersRepository.instance;

  Future<User> getUser() async {
    return await _usersRepository.getUser();
  }

  Future<void> updateUser(User user) async {
    await _usersRepository.updateUser(user);
  }

  Future<void> updateToken(String? token) async {
    await _usersRepository.updateToken(token);
  }
}
