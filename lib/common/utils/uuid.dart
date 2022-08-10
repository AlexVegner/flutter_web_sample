import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

String uuid() {
  return const Uuid().v4();
}

var _counter = 0;

String mockUuid() {
  _counter++;
  final u = const Uuid().v4(options: {
    'rng': UuidUtil.mathRNG,
    'namedArgs': Map.fromIterables([const Symbol('seed')], [_counter])
  });
  return u;
}
