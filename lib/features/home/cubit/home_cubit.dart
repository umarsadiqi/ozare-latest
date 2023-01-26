import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.home);

  void setTab(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return emit(HomeState.home);
      case 1:
        return emit(HomeState.payments);
      case 2:
        return emit(HomeState.notifications);
      case 3:
        return emit(HomeState.profile);
    }
  }
}
