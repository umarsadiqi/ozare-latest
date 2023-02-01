part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class EventInitializedRequested extends EventEvent {
  final Event event;

  const EventInitializedRequested({required this.event});

  @override
  List<Object> get props => [event];
}
