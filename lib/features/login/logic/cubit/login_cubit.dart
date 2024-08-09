import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>
{
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());


  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void emitLoginState()async
  {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
      )
    );
    
    response.when(
        success: (loginRequestBody)
    {
      emit(LoginState.success(loginRequestBody));

    }, failure: (error)
    {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}