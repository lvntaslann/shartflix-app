import 'dart:io';
import 'package:bloc/bloc.dart';
import '../../model/user/user_model.dart';
import '../../services/photo_services.dart';
import 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  final PhotoServices photoServices;

  PhotoCubit(this.photoServices) : super(PhotoState());

  Future<void> uploadPhoto(File file) async {
    emit(state.copyWith(isUploading: true, error: null));
    try {
      final result = await photoServices.uploadPhoto(file);
      if (result['success']) {
        final userData = result['user'];
        final updatedUser = UserModel.fromJson(userData, '');
        emit(state.copyWith(user: updatedUser, isUploading: false));
      } else {
        emit(state.copyWith(isUploading: false, error: result['error']));
      }
    } catch (e) {
      emit(state.copyWith(isUploading: false, error: e.toString()));
    }
  }
}