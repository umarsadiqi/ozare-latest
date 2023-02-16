import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/auth/repository/repository.dart';
import 'package:ozare/features/dash/repository/dash_repository.dart';
import 'package:ozare/main.dart';
import 'package:ozare/models/models.dart';

part 'dash_event.dart';
part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  DashBloc({
    required DashRepository dashRepository,
  })  : _dashRepository = dashRepository,
        super(const DashLoading()) {
    on<DashLeaguesRequested>(_onDashLeaguesRequested);
    on<DashCategoryChanged>(_onDashCategoryChanged);
  }

  final DashRepository _dashRepository;

  /// category changed
  void _onDashCategoryChanged(
    DashCategoryChanged event,
    Emitter<DashState> emit,
  ) {
    emit(const DashLoading());
    add(DashLeaguesRequested(event.category));
  }

  /// This method is called when the DashLeaguesRequested event is added.
  void _onDashLeaguesRequested(
    DashLeaguesRequested event,
    Emitter<DashState> emit,
  ) async {
    log('DashLeaguesRequested event called!');
    try {
      while (true) {
        final leagues =
            await _dashRepository.getLeagues(categoryToStr(event.category));
        if (event.category == DashCategory.soccer) {
          emit(DashSoccerState(
            leagues: leagues,
          ));
        } else if (event.category == DashCategory.basketball) {
          emit(DashSoccerState(leagues: leagues));
        }

        await Future<void>.delayed(const Duration(seconds: 60));
      }
    } catch (error) {
      emit(DashFailure(error.toString()));
    }
  }

  /// helper function
  String categoryToStr(DashCategory category) {
    switch (category) {
      case DashCategory.soccer:
        return 'soccer';
      case DashCategory.basketball:
        return 'basketball';
    }
  }
}
