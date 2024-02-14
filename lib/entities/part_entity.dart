import 'package:test_driven_app/entities/accessories_entity.dart';

class PartEntity {
  final int id;
  final String name;
  final List<AccessorieEntity> accesories;

  const PartEntity(
      {required this.id, required this.name, required this.accesories});
}
