import 'package:pizza_repository/src/entitites/macros_entity.dart';

class Macros {
  int calories;
  int proteins;
  int fat;
  int carbs;

  Macros({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.proteins,
  });

  static final empty = Macros(
    calories: 0,
    carbs: 0,
    fat: 0,
    proteins: 0,
  );

  MacrosEntity toEntity() {
    return MacrosEntity(
      calories: calories,
      carbs: carbs,
      fat: fat,
      proteins: proteins,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
      calories: entity.calories,
      carbs: entity.carbs,
      fat: entity.fat,
      proteins: entity.proteins,
    );
  }
}
