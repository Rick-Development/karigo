import 'package:karingo_v2/features/cart/domain/models/cart_model.dart';
import 'package:karingo_v2/features/product/domain/models/product_model.dart';

abstract class CartServiceInterface{

  Future<dynamic> getList();

  Future<dynamic> delete(int id);

  Future<dynamic> addToCartListData(CartModelBody cart, List<ChoiceOptions> choiceOptions, List<int>? variationIndexes);

  Future<dynamic> updateQuantity(int? key,int quantity);



}