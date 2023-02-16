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

class EventBetRequested extends EventEvent {
  final Event event;

  const EventBetRequested({required this.event});

  @override
  List<Object> get props => [event];
}

class EventLiveRequested extends EventEvent {
  final Event event;
  final String category;

  const EventLiveRequested({
    required this.event,
    required this.category,
  });

  @override
  List<Object> get props => [event, category];
}

class EventToggleLive extends EventEvent {
  const EventToggleLive();

  @override
  List<Object> get props => [];
}
