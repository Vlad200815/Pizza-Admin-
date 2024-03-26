import 'package:pizza_repository/src/entitites/pizza_entity.dart';
import 'package:pizza_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;
  int itemCount;

  Pizza({
    required this.pizzaId,
    required this.description,
    required this.discount,
    required this.isVeg,
    required this.macros,
    required this.name,
    required this.picture,
    required this.price,
    required this.spicy,
    required this.itemCount,
  });

  static final empty = Pizza(
    description: "",
    discount: 0,
    isVeg: false,
    itemCount: 0,
    macros: Macros.empty,
    name: "",
    picture: "",
    pizzaId: const Uuid().v1(),
    price: 0,
    spicy: 0,
  );

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      isVeg: isVeg,
      description: description,
      discount: discount,
      macros: macros,
      name: name,
      picture: picture,
      price: price,
      spicy: spicy,
      itemCount: itemCount,
    );
  }

  static Pizza fromPizzaEntity(PizzaEntity entity) {
    return Pizza(
      pizzaId: entity.pizzaId,
      isVeg: entity.isVeg,
      description: entity.description,
      discount: entity.discount,
      macros: entity.macros,
      name: entity.name,
      picture: entity.picture,
      price: entity.price,
      spicy: entity.spicy,
      itemCount: entity.itemCount,
    );
  }

  @override
  String toString() {
    return '''
    pizzaId: $pizzaId, 
    picture: $picture, 
    isVeg: $isVeg, 
    spicy: $spicy, 
    name: $name, 
    description: $description, 
    price: $price, 
    discount: $discount, 
    macros: $macros,
    ''';
  }
}
