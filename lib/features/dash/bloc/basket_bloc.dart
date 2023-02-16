import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dash/repository/dash_repository.dart';

import 'basket_event.dart';
import 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc({
    required DashRepository dashRepository,
  })  : _dashRepository = dashRepository,
        super(const BasketState(leagues: [])) {
    on<BasketLeaguesRequested>(_onBasketLeaguesRequested);
  }

  final DashRepository _dashRepository;

  /// Event handler for BasketLeaguesRequested
  void _onBasketLeaguesRequested(
    BasketLeaguesRequested event,
    Emitter<BasketState> emit,
  ) async {
    log('DashBasketLeaguesRequested event called!');
    try {
      emit(state.copyWith(status: BasketStatus.loading, message: 'Loading...'));
      while (true) {
        final leagues = await _dashRepository.getLeagues('basket');
        emit(BasketState(
            leagues: leagues,
            status: BasketStatus.success,
            message: 'success'));

        await Future<void>.delayed(const Duration(seconds: 5));
      }
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
          status: BasketStatus.failure, message: error.toString()));
    }
  }
}
