import 'package:karingo_v2/interface/repo_interface.dart';

abstract class CompareRepositoryInterface<T> extends RepositoryInterface{

  Future<dynamic> addCompareProductList(int id);
  Future<dynamic> removeAllCompareProductList();
  Future<dynamic> replaceCompareProductList(int compareId, int productId);
  Future<dynamic> getAttributeList();
}