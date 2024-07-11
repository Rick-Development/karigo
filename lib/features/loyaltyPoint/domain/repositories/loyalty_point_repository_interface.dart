import 'package:karingo_v2/interface/repo_interface.dart';

abstract class LoyaltyPointRepositoryInterface implements RepositoryInterface{
  Future<dynamic> convertPointToCurrency(int point);
}