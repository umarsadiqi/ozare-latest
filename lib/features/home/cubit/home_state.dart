part of 'home_cubit.dart';

enum HomeState {
  home(0),
  payments(1),
  notifications(2),
  profile(3);

  const HomeState(this.tabIndex);
  final int tabIndex;
}
