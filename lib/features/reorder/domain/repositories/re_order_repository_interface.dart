import 'package:karingo_v2/interface/repo_interface.dart';

abstract class ReOrderRepositoryInterface<T> extends RepositoryInterface{

  Future<dynamic> reorder(String orderId);


}