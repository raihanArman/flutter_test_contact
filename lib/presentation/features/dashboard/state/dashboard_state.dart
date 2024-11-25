import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final int index;

  const DashboardState({required this.index});

  @override
  List<Object?> get props => [index];
}
