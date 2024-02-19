import "package:flutter_bloc/flutter_bloc.dart";
import "package:satset/module/forgot%20password/forgot_password_event.dart";
import "package:satset/module/forgot%20password/forgot_password_state.dart";


class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    {}
  }
}
