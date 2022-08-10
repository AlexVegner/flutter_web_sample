import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/cubits/me/me_state.dart';
import 'package:web_app/models/user.dart';
import 'package:web_app/service/me/me_service.dart';

class MeCubit extends Cubit<MeState> {
  final MeService meService;
  MeCubit({required this.meService}) : super(MeState());

  Future<void> getMe() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await meService.me();
      emit(state.copyWith(user: user));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> updateMe(User doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await meService.update(doc);
      emit(state.copyWith(user: user));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
