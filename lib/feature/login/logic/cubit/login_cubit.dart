import 'package:doc_app/core/networking/api_result.dart';
import 'package:doc_app/feature/login/data/models/login_request_body.dart';
import 'package:doc_app/feature/login/data/repos/login_repo.dart';
import 'package:doc_app/feature/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final respone = await _loginRepo.login(loginRequestBody);

    respone.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
