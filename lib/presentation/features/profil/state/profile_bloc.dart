import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_contact/domain/usecase/get_contact_by_userid_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/get_session_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/domain/usecase/save_session_usecase.dart';
import 'package:flutter_test_contact/presentation/features/profil/state/profile_event.dart';
import 'package:flutter_test_contact/presentation/features/profil/state/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetContactByUserIdUseCase getContactByUserIdUseCase;
  final GetSessionLoginUseCase getSessionLoginUseCase;
  final SaveSessionLoginUseCase saveSessionLoginUseCase;

  ProfileBloc({
    required this.getContactByUserIdUseCase,
    required this.getSessionLoginUseCase,
    required this.saveSessionLoginUseCase,
  }) : super(ProfileInitial()) {
    on<FetchProfile>(_onFetchProfile);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final userId = await getSessionLoginUseCase.call(NoParams());
      if (userId == null || userId.isEmpty) {
        emit(ProfileError("No user logged in."));
        return;
      }

      final contact = await getContactByUserIdUseCase.call(userId);
      if (contact == null) {
        emit(ProfileError("User not found."));
      } else {
        emit(ProfileLoaded(contact));
      }
    } catch (e) {
      log("Error fetching profile: $e");
      emit(ProfileError("Failed to fetch profile: $e"));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await saveSessionLoginUseCase.call("");
      emit(ProfileLoggedOut());
    } catch (e) {
      log("Error during logout: $e");
      emit(ProfileError("Failed to logout: $e"));
    }
  }
}
