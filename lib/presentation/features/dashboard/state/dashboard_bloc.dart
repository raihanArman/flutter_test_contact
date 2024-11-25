import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/state/dashboard_event.dart';
import 'package:flutter_test_contact/presentation/features/dashboard/state/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState(index: 0)) {
    on<DashboardIndexChanged>((event, emit) {
      emit(DashboardState(index: event.index));
    });
  }
}
