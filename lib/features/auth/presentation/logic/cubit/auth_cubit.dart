import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/helpers/cache_helper.dart';
import 'package:doctor_booking/features/auth/data/models/user.dart';
import 'package:doctor_booking/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.auth) : super(AuthInitial());
  final AuthRepo auth;

  void login({required String email, required String password}) {
    emit(LoginLoading());
    auth.defaultLogin(email, password, (failure) {
      emit(LoginFailure(failure.message));
    }, (data) {
      // make any actions on data here
      UserModel user = UserModel.fromJson(data['user']);
      CacheHelper.setString(AppStrings.kToken,data['token']);
      CacheHelper.setString(AppStrings.kUser,userModelToJson(user));
      emit(LoginSuccess());
    });
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoading());
    auth.register(name, email, password, (failure) {
      emit(RegisterFailure(failure.message));
    }, (data) {
      emit(RegisterSuccess());
    });
  }
}
