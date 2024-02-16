// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class JobOrderEntity {
  final String Id;
  final String FechaHoraInicio;
  final int TimestampFechaHoraInicio;
  final String? FechaHoraFinal;
  final String FechaCreada;
  final int IdEstado;
  final String Estado;
  final String IdVehiculo;
  final String IdLinea;
  final String Linea;
  final String Placa;
  final String Modelo;
  final String Color;
  final String NumMotor;
  final String NumArmado;
  final String NumSeguridad;
  final String NumChasis;
  final String NumSerie;
  final String NumCabina;

  const JobOrderEntity(
      {required this.Id,
      required this.FechaHoraInicio,
      required this.TimestampFechaHoraInicio,
      this.FechaHoraFinal,
      required this.FechaCreada,
      required this.IdEstado,
      required this.Estado,
      required this.IdVehiculo,
      required this.IdLinea,
      required this.Linea,
      required this.Placa,
      required this.Modelo,
      required this.Color,
      required this.NumMotor,
      required this.NumArmado,
      required this.NumSeguridad,
      required this.NumChasis,
      required this.NumSerie,
      required this.NumCabina});

  factory JobOrderEntity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'Id': String Id,
        'FechaHoraInicio': String FechaHoraInicio,
        'TimestampFechaHoraInicio': int TimestampFechaHoraInicio,
        'FechaHoraFinal': String? FechaHoraFinal,
        'FechaCreada': String FechaCreada,
        'IdEstado': int IdEstado,
        'Estado': String Estado,
        'IdVehiculo': String IdVehiculo,
        'IdLinea': String IdLinea,
        'Linea': String Linea,
        'Placa': String Placa,
        'Modelo': String Modelo,
        'Color': String Color,
        'NumMotor': String NumMotor,
        'NumArmado': String NumArmado,
        'NumSeguridad': String NumSeguridad,
        'NumChasis': String NumChasis,
        'NumSerie': String NumSerie,
        'NumCabina': String NumCabina,
      } =>
        JobOrderEntity(
            Id: Id,
            FechaHoraInicio: FechaHoraInicio,
            TimestampFechaHoraInicio: TimestampFechaHoraInicio,
            FechaHoraFinal: FechaHoraFinal,
            FechaCreada: FechaCreada,
            IdEstado: IdEstado,
            Estado: Estado,
            IdVehiculo: IdVehiculo,
            IdLinea: IdLinea,
            Linea: Linea,
            Placa: Placa,
            Modelo: Modelo,
            Color: Color,
            NumMotor: NumMotor,
            NumArmado: NumArmado,
            NumSeguridad: NumSeguridad,
            NumChasis: NumChasis,
            NumSerie: NumSerie,
            NumCabina: NumCabina),
      _ =>
        throw const FormatException('error al parser tipo de orden de trabajo'),
    };
  }
}
