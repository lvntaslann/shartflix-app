import '../../model/user/user_model.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final UserModel? user;
  final String email;
  final String password;
  final String name;
  final bool isSuccess;
  

  AuthState({
    this.isLoading = false,
    this.error,
    this.user,
    this.email = '',
    this.password = '',
    this.name = '',
    this.isSuccess = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    UserModel? user,
    String? email,
    String? password,
    String? name,
    bool? isSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      isSuccess: isSuccess ?? this.isSuccess
    );
  }
}
