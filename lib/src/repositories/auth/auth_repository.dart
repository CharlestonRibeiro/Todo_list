import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        return UserModel(
            name: _firebaseAuth.currentUser?.displayName,
            email: _firebaseAuth.currentUser!.email!,
            id: _firebaseAuth.currentUser!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      switch (e.message) {
        case 'The email address is already in use by another account.':
          throw 'Esse e-mail já está associado a uma conta do Porkin.io. Verifique seus dados ou solicite a recuperação de conta.';

        case 'The password is invalid or the user does not have a password.':
          throw 'A combinação de senha e/ou e-mail inserida não é valida. Verifique os dados e tente novamente.';

        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          throw 'Conta de usuário não identificada. Verifique os dados e tente novamente.';

        case 'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.':
          throw 'O acesso a essa conta está temporariamente suspenso devido às diversas tentativas de entrada com dados inválidos. Solicite a recuperação de conta ou tente novamente mais tarde';

        default:
          throw 'Falha na tentativa de login. Encontramos um erro inesperado. Verifique seus dados ou tente novamente mais tarde.';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      var loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        log('password');
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else {
        AuthException(message: 'E-mail não cadastrado');
      }
    } on PlatformException catch (e, s) {
      log(e.message.toString());
      log(s.toString());
      throw AuthException(message: 'Erro ao recuperar senha');
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

}
