import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardIndexChanged extends DashboardEvent {
  final int index;

  const DashboardIndexChanged(this.index);

  @override
  List<Object?> get props => [index];
}
