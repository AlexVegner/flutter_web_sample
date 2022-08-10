import 'package:web_app/models/token.dart';
import 'package:web_app/models/user.dart';
import 'package:web_app/service/auth/auth_service.dart';

class AuthServiceMock implements AuthService {
  Token? _token;

  @override
  Future<Token> login(String email, String password) async {
    _token = Token(
        token: '123', expired: DateTime.now().add(const Duration(hours: 1)));
    return _token!;
  }

  @override
  Future<Token> signup(User user) async {
    _token = Token(
        token: '123', expired: DateTime.now().add(const Duration(hours: 1)));
    return _token!;
  }

  @override
  Future<Token> token() async {
    return _token!;
  }
}
