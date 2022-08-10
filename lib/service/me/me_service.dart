import 'package:web_app/models/user.dart';

abstract class MeService {
  Future<User?> me();

  Future<User> update(User doc);
}
