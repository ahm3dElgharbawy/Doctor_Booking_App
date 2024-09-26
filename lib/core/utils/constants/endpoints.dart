class EndPoints {
  EndPoints._internal(); // disable class constructor

  static const baseUrl = "http://192.168.64.10:8000/api";
  static const login = "$baseUrl/login";
  static const register = "$baseUrl/register";
  static const logout = "$baseUrl/logout";

  static const home = "$baseUrl/home";
  static const makeAppointment = "$baseUrl/appointment";
  static const schedules = "$baseUrl/doctor-schedules";

}