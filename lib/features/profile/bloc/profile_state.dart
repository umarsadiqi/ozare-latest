part of 'profile_bloc.dart';

enum ProfileStatus { loading, loaded, failure }

enum PPage {
  profile,
  settings,
  editAccount,
  notifications,
  wallet,
  selectLanguage,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.loading,
    this.page = PPage.profile,
    this.user,
    this.message = '',
  });

  final ProfileStatus status;
  final PPage page;
  final OUser? user;
  final String message;

  ProfileState copyWith({
    ProfileStatus? status,
    PPage? page,
    OUser? user,
    String? message,
  }) {
    return ProfileState(
      status: status ?? this.status,
      page: page ?? this.page,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, page, message];
}
