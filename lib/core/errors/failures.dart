import 'package:dio/dio.dart';

class Failure {
  final String message;
  const Failure(this.message);

  factory Failure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return const Failure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return const Failure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return Failure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return const Failure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return const Failure('Please check your internet connection');
      default:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return const Failure('No Internet Connection');
        }
        return const Failure('Oops There was an Error, Please try again');
    }
  }

  factory Failure.fromResponse(int? statusCode, dynamic data) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 405 ||
        statusCode == 422) {
      // if (statusCode == 401) { // when token expired
      //   CacheHelper.setString(kInitialScreenIndex,"1"); // open later on the login screen if not logged in
      //   NavigationHelper.pushReplacementAll(const LoginScreen());
      // }
      // print(object)
      return Failure(data['message']);
    } else if (statusCode == 404) {
      return const Failure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return const Failure('Internal Server error, Please try later');
    } else {
      return Failure( data['message'] ?? 'Oops There was an Error, Please try again');
    }
  }
}
