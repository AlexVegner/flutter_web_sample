import 'package:web_app/models/user.dart';

class MeState {
  final bool isLoading;
  final User? user;

  MeState({
    this.isLoading = false,
    this.user,
  });

  MeState copyWith({
    bool? isLoading,
    User? user,
  }) {
    return MeState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
