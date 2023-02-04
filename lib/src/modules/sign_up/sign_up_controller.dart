import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/modules/sign_up/sing_up_state.dart';
import 'package:todo_list/src/services/auth_service.dart';
import 'package:todo_list/src/services/secure_storage.dart';

class SignUpController extends Cubit<SignUpState> {
  final AuthService _service;


  SignUpController(this._service)
      : super(SignUpInitialState());

  final SecureStorage _secureStorage = const SecureStorage();    

  Future<void> doSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
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
      emit(SignUpSucessState());
    } catch (e) {
      log(e.toString());
      emit(SignUpErrorState(e.toString()));
    }
  }
}
