import 'package:doctor_booking/core/errors/failures.dart';
import 'package:doctor_booking/core/services/dio_services.dart';
import 'package:doctor_booking/core/utils/constants/endpoints.dart';

abstract class HomeRepo {
  void homeData(
    void Function(Failure failure) onError,
    void Function(dynamic data) onSuccess,
  );
}

class HomeRepoImpl implements HomeRepo {
  @override
  void homeData(onError, onSuccess) {
    DioServices.getData(url: EndPoints.home).then((result) {
      result.fold(
        onError,
        (response) => onSuccess(response.data),
      );
    });
  }
}
