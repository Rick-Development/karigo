import 'package:karingo_v2/interface/repo_interface.dart';

abstract class OrderDetailsRepositoryInterface<T> extends RepositoryInterface{

  Future<dynamic> getOrderFromOrderId(String orderID);

  Future<dynamic> downloadDigitalProduct(int orderDetailsId);

  Future<dynamic> resendOtpForDigitalProduct(int orderId);

  Future<dynamic> otpVerificationForDigitalProduct(int orderId, String otp);

  Future<dynamic> trackYourOrder(String orderId, String phoneNumber);

}