import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pizza_repository/pizza_repository.dart';
import 'dart:html' as html;

abstract class PizzaRepo {
  /////////HOME////////////////
  Future<List<Pizza>> getPizzas();

  /////////CART//////////////////
  Future<List<Pizza>> getAddedPizzas();

  Future<void> createNewPizzas(
    String pizzaId,
    String description,
    int discount,
    int price,
    bool isVeg,
    Macros macros,
    String name,
    String picture,
    int spicy,
    int itemCount,
  );

  Future<void> deletePizzas(String pizzaId);
  Future<void> updateItemCount(String field, String pizzaId, var newFieldValue);
  Future<String> sendImage(Uint8List file);

  // create method for order form
  Future<void> createNewOrder(
    String orderId,
    String name,
    int phoneNumber,
    String city,
    int house,
    int apartament,
    String payment,
    String wish,
    bool isRecall,
  );
}
