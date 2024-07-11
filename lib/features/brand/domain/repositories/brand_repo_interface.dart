import 'package:karingo_v2/interface/repo_interface.dart';

abstract class BrandRepoInterface<T> implements RepositoryInterface{

  Future<dynamic> getSellerWiseBrandList(int sellerId);
}