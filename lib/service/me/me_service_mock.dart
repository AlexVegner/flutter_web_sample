import 'package:web_app/common/utils/uuid.dart';
import 'package:web_app/models/user.dart';
import 'package:web_app/service/me/me_service.dart';

class MeServiceMock implements MeService {
  User _user = _genUser();

  @override
  Future<User> me() async {
    return _user;
  }

  @override
  Future<User> update(User doc) async {
    _user = doc;
    return _user;
  }

  static User _genUser() {
    return User(
      id: uuid(),
      email: "test@email.com",
      firstName: "Alex",
      lastName: "V",
    );
  }
}
