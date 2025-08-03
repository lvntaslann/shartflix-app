import '../../model/user/user_model.dart';
class PhotoState {
  final bool isUploading;
  final String? error;
  final UserModel? user;

  PhotoState({this.isUploading = false, this.error, this.user});

  PhotoState copyWith({
    bool? isUploading,
    String? error,
    UserModel? user,
  }) {
    return PhotoState(
      isUploading: isUploading ?? this.isUploading,
      error: error,
      user: user ?? this.user,
    );
  }
}
