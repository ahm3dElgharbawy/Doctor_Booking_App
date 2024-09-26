import 'package:doctor_booking/core/errors/failures.dart';
import 'package:doctor_booking/core/services/dio_services.dart';
import 'package:doctor_booking/core/utils/constants/endpoints.dart';

abstract class AuthRepo {
  void defaultLogin(
    String email,
    String password,
    void Function(Failure failure) onError,
    void Function(dynamic data) onSuccess,
  );
  void register(
    String name,
    String email,
    String password,
    void Function(Failure failure) onError,
    void Function(dynamic data) onSuccess,
  );
}

class AuthRepoImpl implements AuthRepo {
  @override
  defaultLogin(String email, password, onError, onSuccess) {
    DioServices.postData(
        url: EndPoints.login,
        data: {'email': email, 'password': password}).then((result) {
      result.fold(onError, (response) => onSuccess(response.data));
    });
  }

  @override
  register(name, email, password, onError, onSuccess) {
    DioServices.postData(url: EndPoints.register,data: {
      'name' : name,
      'email' : email,
      'password' : password
    }).then((result) {
      result.fold(onError, (response) => onSuccess(response.data));
    });
  }
}
