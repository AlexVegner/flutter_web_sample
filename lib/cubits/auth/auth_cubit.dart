import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/auth/auth_state.dart';
import 'package:web_app/models/user.dart';
import 'package:web_app/service/auth/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  AuthCubit({required this.authService}) : super(AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      final token = await authService.login(email, password);
      emit(state.copyWith(token: token));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> signup(User user) async {
    emit(state.copyWith(isLoading: true));
    try {
      final token = await authService.signup(user);
      emit(state.copyWith(token: token));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> logout(String email, String password) async {
    emit(AuthState());
  }
}
