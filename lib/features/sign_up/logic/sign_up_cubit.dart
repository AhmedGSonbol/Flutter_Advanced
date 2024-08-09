import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_advanced/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/sign_up_request_body.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async
  {
    emit(const SignUpState.signUpLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignUpState.signUpSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ''));
    });
  }
}