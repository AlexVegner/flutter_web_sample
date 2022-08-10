import 'package:web_app/models/token.dart';

import '../../models/user.dart';

abstract class AuthService {
  Future<Token> login(String email, String password);
  Future<Token> signup(User user);
  Future<Token> token();
}
