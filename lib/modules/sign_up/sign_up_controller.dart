import 'dart:developer';
import 'package:todo_list/services/auth_service.dart';
import 'package:todo_list/services/secure_storage.dart';

class SignUpController {
  final AuthService _service;
  final SecureStorage _secureStorage;

  SignUpController(this._service, this._secureStorage);

  Future<void> doSignUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await _secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
      } else {
        throw Exception();
      }
      log('usuario criado com sucesso');
    } catch (e) {
      log(e.toString());
    }
  }
}
