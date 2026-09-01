import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/src/domain/entity/profile/profile_model.dart';
import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/util/logger_mixin.dart';


part 'profile_state_cubit.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const ProfileState._();

  const factory ProfileState.initial() = ProfileStateInitial;
  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded({
    required ProfileModel profile,
  }) = ProfileLoadedState;
  const factory ProfileState.error() = ProfileErrorState;
}

abstract class ProfileStateCubit extends Cubit<ProfileState> {
  ProfileStateCubit() : super(const ProfileState.initial());

  Future<void> loadProfile(
    String profileId, {
    ProfileModel? profile,
    void Function(ProfileModel)? onComplete,
    void Function(Object?, StackTrace)? onError,
  });

  void clearData();
}
