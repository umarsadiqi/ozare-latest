part of 'event_bloc.dart';

enum EventStatus { initial, loading, success, failure }

class EventState extends Equatable {
  const EventState({
    this.status = EventStatus.initial,
  });

  final EventStatus status;

  EventState copyWith({
    EventStatus? status,
  }) {
    return EventState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [];
}
