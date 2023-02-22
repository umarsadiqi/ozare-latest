import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/event/bloc/event_bloc.dart';
import 'package:ozare/features/event/view/event_view.dart';
import 'package:ozare/models/models.dart';

class EventPage extends StatelessWidget {
  const EventPage({
    super.key,
    required this.leagueId,
    required this.event,
    required this.isLive,
    required this.fixture,
  });

  final String? leagueId;
  final Event event;
  final bool isLive;
  final Fixture? fixture;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, EventState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return EventView(
          event: event,
          leagueId: leagueId,
          isLive: isLive,
          fixture: fixture,
        );
      },
    );
  }
}
