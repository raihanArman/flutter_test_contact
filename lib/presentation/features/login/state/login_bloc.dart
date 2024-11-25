import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/usecase/get_contact_by_userid_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/save_session_usecase.dart';
import 'package:flutter_test_contact/presentation/features/login/state/login_event.dart';
import 'package:flutter_test_contact/presentation/features/login/state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetContactByUserIdUseCase getContactByUserIdUseCase;
  final SaveSessionLoginUseCase saveSessionLoginUseCase;

  LoginBloc({
    required this.getContactByUserIdUseCase,
    required this.saveSessionLoginUseCase,
  }) : super(LoginInitial()) {
    on<LoginRequested>(_onLogin);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final contact = await getContactByUserIdUseCase.call(event.userId);

      if (contact != null) {
        await saveSessionLoginUseCase.call(contact.id);
        emit(LoginSuccess(contact: contact));
      } else {
        emit(LoginFailure(message: "Login failed: User not found"));
      }
    } catch (e) {
      log('Login error: $e');
      emit(LoginFailure(message: "Login failed: $e"));
    }
  }
}
