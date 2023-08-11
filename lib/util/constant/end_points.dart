abstract class AppEndPoints {
  static const String baseUrl = "https://api.msool.io";
  static const String login = "/Auth/ServiceProviderLogin";
  static const String allPendingRequestCleanService =
      "/ServiceProvider/GetAllPendingRequestCleanService";
  static const String updateRequestCleanServiceStatus =
      "/ServiceProvider/UpdateRequestCleanServiceStatus";
  static const String acceptedOrderRequestCleanService =
      "/ServiceProvider/getSpOrderRequestCleanService";
  static const String getSpEmployee = "/ServiceProvider/GetSpEmployee";
  static const String registerSpEmployee =
      "/ServiceProvider/RegisterSpEmployee";
  static const String editSpEmployee = "/ServiceProvider/EditSpEmployee";
  static const String getSpEmployeeForOrderAssign =
      "/ServiceProvider/GetSpEmployeeForOrderAssign";
  static const String getServiceTimeSlots =
      "/ServiceProvider/GetServiceTimeSlots";

  static const String getAllSpOrderAssign =
      "/ServiceProvider/GetAllSpOrderAssign";

  static const String assignRequestCleanServiceToEmployee =
      "/ServiceProvider/AssignRequestCleanServiceToEmployee";

  static const String getSpEmployeeAvailableForToDay =
      "/ServiceProvider/GetSpEmployeeAvailableForToDay";

  static const String getOrderAssignScheduleForSpEmployee =
      "/ServiceProvider/GetOrderAssignScheduleForSpEmployee";
}
