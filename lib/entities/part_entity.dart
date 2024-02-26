// ignore_for_file: non_constant_identifier_names

class PartTypeEntity {
  final String Id;
  final String Nombre;
  final String FechaCreado;
  final String FechaModificado;

  const PartTypeEntity(
      {required this.Id,
      required this.FechaCreado,
      required this.FechaModificado,
      required this.Nombre});

  factory PartTypeEntity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'Id': String id,
        'Nombre': String nombre,
        'FechaCreado': String fechaCreado,
        'FechaModificado': String fechaModificado
      } =>
        PartTypeEntity(
            Id: id,
            Nombre: nombre,
            FechaCreado: fechaCreado,
            FechaModificado: fechaModificado),
      _ => throw const FormatException('error al parsear tipo parte'),
    };
  }
}
