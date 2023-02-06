import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/core/exception/auth_exception.dart';
import 'package:todo_list/src/modules/auth/recover_password/recover_password_state.dart';
import 'package:todo_list/src/services/auth_service.dart';


//TODO REVER LOGIA DO RECOVER PASSWORD
class RecoverPasswordController extends Cubit<RecoverPasswordState> {
  final AuthService _firebaseAuthService;

  RecoverPasswordController(this._firebaseAuthService)
      : super(RecoverPasswordInitialState());

  late String infoMessage;

  Future<void> forgotPassword({required String email}) async {
    emit(RecoverPasswordLoadingState());
    await _firebaseAuthService.forgotPassword(email);
    try {
      infoMessage = 'O Reset da senha foi enviado para o seu e-mail.';
      emit(RecoverPasswordSuccessState());
    } on AuthException catch (e) {
      RecoverPasswordErrorState(e.message);
    } catch (e) {
      RecoverPasswordErrorState("Erro, tente novamente");
    }
  }
}
