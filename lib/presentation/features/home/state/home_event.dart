import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchContacts extends HomeEvent {}

class SearchContacts extends HomeEvent {
  final String query;

  const SearchContacts({required this.query});
}
