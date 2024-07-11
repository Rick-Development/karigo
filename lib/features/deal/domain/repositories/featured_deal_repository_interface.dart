import 'package:karingo_v2/interface/repo_interface.dart';

abstract class FeaturedDealRepositoryInterface implements RepositoryInterface{

  Future<dynamic> getFeaturedDeal();
}