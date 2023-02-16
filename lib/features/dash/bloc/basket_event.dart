import 'package:equatable/equatable.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class BasketLeaguesRequested extends BasketEvent {
  const BasketLeaguesRequested();

  @override
  List<Object> get props => [];
}

class BasketToggleLive extends BasketEvent {
  const BasketToggleLive();

  @override
  List<Object> get props => [];
}
