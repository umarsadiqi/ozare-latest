import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ozare/features/event/repository/event_repository.dart';
import 'package:ozare/models/event.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({
    required EventRepository eventRepository,
  })  : _eventRepository = eventRepository,
        super(const EventState(
            event: Event(
          category: 'soccer',
          id: '',
          id1: '',
          id2: '',
          score1: '',
          score2: '',
          team1: '',
          team2: '',
          time: '',
          logo1: '',
          logo2: '',
        ))) {
    on<EventInitializedRequested>(_onEventInitializedRequested);
    on<EventLiveRequested>(_onEventLiveRequested);
    on<EventToggleLive>(_onEventToggleLive);
  }

  final EventRepository _eventRepository;

  /// EventInitializedRequested
  void _onEventInitializedRequested(
    EventInitializedRequested event,
    Emitter<EventState> emit,
  ) async {
    await _eventRepository.initializeEvent(event.event);
    //emit(state.copyWith(: event.event));
  }

  /// EventLiveRequested
  void _onEventLiveRequested(
    EventLiveRequested event,
    Emitter<EventState> emit,
  ) async {
    emit(state.copyWith(event: event.event));
    while (true) {
      final updatedEvent = await _eventRepository.getEventScoreboard(
        eid: event.event.id,
        category: event.category,
      );
      emit(state.copyWith(event: updatedEvent, isLive: true));

      if (!state.isLive) break;
      // add a delay
      await Future<void>.delayed(const Duration(seconds: 30));
    }
  }

  /// EventToggleLive
  void _onEventToggleLive(
    EventToggleLive event,
    Emitter<EventState> emit,
  ) async {
    emit(state.copyWith(isLive: !state.isLive));
  }
}
