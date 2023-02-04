import 'package:todo_list/src/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({String? name, required String email, required String password});

  Future<UserModel> signIn();

  Future<void> signOut();

  Future<void> forgotPassword();

}
