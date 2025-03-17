import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_service.dart';
import 'auth_state.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  SignUpEvent(this.email, this.password);
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;
  LogInEvent(this.email, this.password);
}

class LogOutEvent extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    // Регистрируем обработчики событий
    on<SignUpEvent>(_onSignUpEvent);
    on<LogInEvent>(_onLogInEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  // Обработчик для SignUpEvent
  Future<void> _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.signUp(email: event.email, password: event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Обработчик для LogInEvent
  Future<void> _onLogInEvent(LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.logIn(email: event.email, password: event.password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Обработчик для LogOutEvent
  Future<void> _onLogOutEvent(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}