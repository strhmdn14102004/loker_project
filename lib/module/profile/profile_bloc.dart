import "package:flutter_bloc/flutter_bloc.dart";
import "package:satset/module/profile/profile_event.dart";
import "package:satset/module/profile/profile_state.dart";




class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    {}
  }
}
