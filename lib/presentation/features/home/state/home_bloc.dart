import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/domain/usecase/fetch_contact_usecase.dart';
import 'package:flutter_test_contact/domain/usecase/params/params.dart';
import 'package:flutter_test_contact/presentation/features/home/state/home_event.dart';
import 'package:flutter_test_contact/presentation/features/home/state/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchContactsUseCase useCase;

  HomeBloc({required this.useCase}) : super(HomeInitial()) {
    on<FetchContacts>(_onFetchContacts);
    on<SearchContacts>(_onSearchContacts);
  }

  Future<void> _onFetchContacts(
    FetchContacts event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final contacts = await useCase.call(NoParams());
      emit(HomeLoaded(contacts));
    } catch (e) {
      emit(HomeError('Failed to load contacts: $e'));
    }
  }

  Future<void> _onSearchContacts(
      SearchContacts event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      final stateLoaded = state as HomeLoaded;

      if (event.query.isEmpty) {
        emit(HomeLoaded(stateLoaded.contacts));
      } else {
        final filteredContacts = stateLoaded.contacts
            .where((contact) => contact.firstName
                .toLowerCase()
                .contains(event.query.toLowerCase()))
            .toList();

        emit(HomeSearchResults(
          filteredContacts: filteredContacts,
          allContacts: stateLoaded.contacts,
        ));
      }
    } else if (state is HomeSearchResults) {
      final stateLoaded = state as HomeSearchResults;

      if (event.query.isEmpty) {
        emit(HomeLoaded(stateLoaded.allContacts));
      } else {
        final filteredContacts = stateLoaded.allContacts
            .where((contact) => contact.firstName
                .toLowerCase()
                .contains(event.query.toLowerCase()))
            .toList();

        emit(HomeSearchResults(
          filteredContacts: filteredContacts,
          allContacts: stateLoaded.allContacts,
        ));
      }
    }
  }
}
