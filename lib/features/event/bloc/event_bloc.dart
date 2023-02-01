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
        super(const EventState()) {
    on<EventInitializedRequested>(_onEventInitializedRequested);
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
}
