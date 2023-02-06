
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_state.dart';
import 'package:todo_list/src/services/auth_service.dart';
import 'package:todo_list/src/services/secure_storage.dart';

class SignInController extends Cubit<SignInState> {
  final AuthService _authservice;
  SignInController(this._authservice) : super(SignInInitialState());

  final _secureStorage = const SecureStorage();

  Future<void> doLogin(
      {required String email, required String password}) async {

       emit(SignInLoadingState());  

    try {
      final user = await _authservice.signIn(
        email: email,
        password: password,
      );
      if (user.id != null) {
        _secureStorage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        );
      emit(SignInSuccessState());
      } else {
        throw Exception("Usuário não cadastrado");
      }
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }
}

