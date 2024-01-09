// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class Fuel {
  final int Id;
  final String Nombre;

  const Fuel({required this.Id, required this.Nombre});

  factory Fuel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'Id': int Id,
        'Nombre': String Nombre,
      } =>
        Fuel(
          Id: Id,
          Nombre: Nombre,
        ),
      _ => throw const FormatException('error al parser tipo de producto'),
    };
  }
}
