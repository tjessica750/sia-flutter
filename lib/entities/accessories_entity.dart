// ignore_for_file: non_constant_identifier_names

class AccessoriePartEntity {
  final String Id;
  final String Nombre;
  final String IdTipoParte;
  final String TipoDeParte;
  final int IdTipoVehiculo;
  final String TipoDeVehiculo;
  final String FechaCreado;
  final String FechaModificado;

  const AccessoriePartEntity(
      {required this.Id,
      required this.Nombre,
      required this.IdTipoParte,
      required this.TipoDeParte,
      required this.IdTipoVehiculo,
      required this.TipoDeVehiculo,
      required this.FechaCreado,
      required this.FechaModificado});

  factory AccessoriePartEntity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "Id": String id,
        "Nombre": String nombre,
        "IdTipoParte": String idTipoParte,
        "Tipo de Parte": String tipoParte,
        "IdTipoVehiculo": int idTipoVehiculo,
        "Tipo de Vehiculo": String tipoDeVehiculo,
        "FechaCreado": String fechaCreado,
        "FechaModificado": String fechaModificado,
      } =>
        AccessoriePartEntity(
            Id: id,
            Nombre: nombre,
            IdTipoParte: idTipoParte,
            IdTipoVehiculo: idTipoVehiculo,
            TipoDeParte: tipoParte,
            TipoDeVehiculo: tipoDeVehiculo,
            FechaCreado: fechaCreado,
            FechaModificado: fechaModificado),
      _ => throw const FormatException('error al parsear tipo parte'),
    };
  }
}
