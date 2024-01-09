// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class ServiceType {
  final int Id;
  final String Nombre;

  const ServiceType({required this.Id, required this.Nombre});

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'Id': int Id,
        'Nombre': String Nombre,
      } =>
        ServiceType(
          Id: Id,
          Nombre: Nombre,
        ),
      _ => throw const FormatException('error al parser tipo de producto'),
    };
  }
}
