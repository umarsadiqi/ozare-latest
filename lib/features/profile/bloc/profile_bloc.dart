import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozare/features/auth/repository/repository.dart';
import 'package:ozare/features/profile/repository/profile_repository.dart';
import 'package:ozare/main.dart';
import 'package:ozare/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const ProfileState()) {
    on<ProfilePageChanged>(_onProfilePageChanged);
    on<ProfileChanged>(_onProfileChanged);
    on<ProfileHistoryRequested>(_onProfileHistoryRequested);
    on<ProfileNotificationsRequested>(_onProfileNotificationsRequested);
    on<ProfileUpdateRequested>(_onProfileUpdateRequested);
    on<ProfilePhotoUploadRequested>(_onProfilePhotoUploadRequested);
    _ouserSubscription = _profileRepository
        .ouserStream(ouser.uid!)
        .listen((ouser) => add(ProfileChanged(ouser: ouser)));
  }

  final ProfileRepository _profileRepository;
  final OUser ouser = getIt<LocalDBRepository>().getOwner()!;
  late StreamSubscription<OUser> _ouserSubscription;

  @override
  Future<void> close() {
    _ouserSubscription.cancel();
    return super.close();
  }

  /// EVENT HANDLERS
  /// [ProfilePageChanged] event handler
  void _onProfilePageChanged(
    ProfilePageChanged event,
    Emitter<ProfileState> emit,
  ) {
    log('🧱 ProfilePageChanged: ${event.page}');
    emit(state.copyWith(page: event.page));
  }

  /// [ProfileChanged] event handler
  void _onProfileChanged(
    ProfileChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(user: event.ouser, status: ProfileStatus.loaded));
  }

  /// [ProfileHistoryRequested] event handler
  Future<void> _onProfileHistoryRequested(
    ProfileHistoryRequested event,
    Emitter<ProfileState> emit,
  ) async {
    /// listen to history stream
    await emit.forEach(
      _profileRepository.historyStream(ouser.uid!),
      onData: (history) => state.copyWith(history: history),
    );
  }

  /// [ProfileNotificationsRequested] event handler
  Future<void> _onProfileNotificationsRequested(
    ProfileNotificationsRequested event,
    Emitter<ProfileState> emit,
  ) async {
    /// listen to notifications stream
    await emit.forEach(
      _profileRepository.notificationStream(ouser.uid!),
      onData: (notifications) => state.copyWith(notifications: notifications),
    );
  }

  /// [ProfileUpdated] event handler
  Future<void> _onProfileUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    log('🧱 ProfileUpdated: ${event.ouser}');
    emit(state.copyWith(status: ProfileStatus.loading));
    await _profileRepository.updateProfile(event.ouser);
    add(const ProfilePageChanged(PPage.profile));
  }

  /// [ProfilePhotoUploadRequested] event handler
  /// Upload the user's profile photo
  /// and update the user's profile
  /// with the new photo url
  Future<void> _onProfilePhotoUploadRequested(
    ProfilePhotoUploadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    log('🧱 ProfilePhotoUploadRequested');
    emit(state.copyWith(status: ProfileStatus.loading));

    final String photoUrl = await _profileRepository.uploadPhoto(
      state.user.uid!,
      event.imageFile,
    );

    final OUser ouser = state.user.copyWith(photoURL: photoUrl);

    await _profileRepository.updateProfile(ouser);
    emit(state.copyWith(user: ouser, status: ProfileStatus.loaded));
  }
}
