import "package:flutter_bloc/flutter_bloc.dart";
import "package:satset/module/login/login_event.dart";
import "package:satset/module/login/login_state.dart";


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    {}
  }
}
