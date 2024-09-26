
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_booking/core/errors/failures.dart';
import 'package:doctor_booking/core/utils/constants/strings.dart';
import 'package:doctor_booking/core/utils/helpers/cache_helper.dart';

class DioServices {
  static final Dio _dio = Dio();
  static final Map<String, dynamic> _headers = {
    'Accept': 'application/json',
    'Authorization' : 'Bearer ${CacheHelper.getString(AppStrings.kToken)}'
  };
  static Future<Either<Failure, Response>> getData(
      {required String url}) async {
    try {
      Response response = await _dio.get(
        url,
        options: Options(
          headers: _headers,
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(const Failure("UnExpected Failure"));
    }
  }

  static Future<Either<Failure, Response>> postData({
    required String url,
    Object? data,
  }) async {
    try {
      Response response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: _headers,
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
