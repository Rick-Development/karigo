import 'package:karingo_v2/features/cart/domain/models/cart_model.dart';
import 'package:karingo_v2/features/product/domain/models/product_model.dart';
import 'package:karingo_v2/interface/repo_interface.dart';

abstract class CartRepositoryInterface<T> implements RepositoryInterface{

  Future<dynamic> addToCartListData(CartModelBody cart, List<ChoiceOptions> choiceOptions, List<int>? variationIndexes);

  Future<dynamic> updateQuantity(int? key,int quantity);

}