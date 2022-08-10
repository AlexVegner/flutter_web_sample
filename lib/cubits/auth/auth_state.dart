import 'package:web_app/models/token.dart';

class AuthState {
  final bool isLoading;
  final Token? token;

  AuthState({
    this.isLoading = false,
    this.token,
  });

  AuthState copyWith({
    bool? isLoading,
    Token? token,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
    );
  }

  bool get isAuthorized => token != null;
}
