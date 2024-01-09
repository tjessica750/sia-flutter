// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class VehicleType {
  final int Id;
  final String Nombre;

  const VehicleType({required this.Id, required this.Nombre});

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'Id': int Id,
        'Nombre': String Nombre,
      } =>
        VehicleType(
          Id: Id,
          Nombre: Nombre,
        ),
      _ => throw const FormatException('error al parser tipo de producto'),
    };
  }
}
