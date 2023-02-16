part of 'event_bloc.dart';

enum EventStatus { loading, success, failure }

class EventState extends Equatable {
  const EventState({
    this.status = EventStatus.loading,
    required this.event,
    this.isLive = true,
  });

  final EventStatus status;
  final Event event;
  final bool isLive;

  EventState copyWith({
    EventStatus? status,
    Event? event,
    bool? isLive,
  }) {
    return EventState(
      status: status ?? this.status,
      event: event ?? this.event,
      isLive: isLive ?? this.isLive,
    );
  }

  @override
  List<Object> get props => [status, isLive, event];
}
