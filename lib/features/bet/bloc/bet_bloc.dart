import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bet_event.dart';
part 'bet_state.dart';

class BetBloc extends Bloc<BetEvent, BetState> {
  BetBloc() : super(const BetState()) {
    on<BetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
