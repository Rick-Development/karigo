import 'package:karingo_v2/interface/repo_interface.dart';

abstract class ProductDetailsRepositoryInterface implements RepositoryInterface{
  Future<dynamic> getCount(String productID);
  Future<dynamic> getSharableLink(String productID);

}