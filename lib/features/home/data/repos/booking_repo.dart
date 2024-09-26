import 'package:doctor_booking/core/errors/failures.dart';
import 'package:doctor_booking/core/services/dio_services.dart';
import 'package:doctor_booking/core/utils/constants/endpoints.dart';

abstract class BookingRepo {
  void getDoctorSchedules(
    int doctorId,
    void Function(Failure failure) onError,
    void Function(List schedules) onSuccess,
  );

  void makeAppointment(
    Map appointmentData,
    void Function(Failure failure) onError,
    void Function(dynamic data) onSuccess,
  ) {
    
  }
}

class BookingRepoImpl implements BookingRepo {
  @override
  void getDoctorSchedules(doctorId, onError, onSuccess) {
    DioServices.postData(
        url: EndPoints.schedules, data: {'doctor_id': doctorId}).then((result) {
      result.fold(
        onError,
        (response) => onSuccess(response.data['schedules']),
      );
    });
  }
  
  @override
  void makeAppointment(appointmentData, onError,  onSuccess) {
    DioServices.postData(url: EndPoints.makeAppointment,data: appointmentData).then((result){
      result.fold(onError, (response)=>onSuccess(response.data));
    });
  }
}
