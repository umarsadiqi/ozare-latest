import 'package:flutter/material.dart';
import 'package:ozare/features/event/view/event_view.dart';
import 'package:ozare/models/models.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return EventView(event: event);
  }
}
