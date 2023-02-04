import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/src/core/exception/auth_exception.dart';
import 'package:todo_list/src/models/user_model.dart';
import 'package:todo_list/src/services/auth_service.dart';

class AuthRepository implements AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        return UserModel(
            name: _firebaseAuth.currentUser?.displayName,
            email: _firebaseAuth.currentUser!.email!,
            id: _firebaseAuth.currentUser!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e, s) {
      log(e.message.toString());
      log(s.toString());
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthException(
              message: 'E-mail já utilizado, por favor escolha outro e-mail');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar!!!');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<void> forgotPassword() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn() {
    throw UnimplementedError();
  }
}
