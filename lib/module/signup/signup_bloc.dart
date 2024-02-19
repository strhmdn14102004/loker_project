import "package:flutter_bloc/flutter_bloc.dart";
import "package:satset/module/signup/signup_event.dart";
import "package:satset/module/signup/signup_state.dart";



class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    {}
  }
}
