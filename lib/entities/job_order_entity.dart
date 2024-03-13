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
  final int IdTipoVehiculo;
  final String TipoVehiculo;
  final String Linea;
  final String Placa;
  final String Modelo;
  final String ClienteNombre;
  final String ClienteApellido;
  final String Marca;
  final String Clase;
  final String CODFASECOLDA;
  final int NumeroRevision;
  final String TipoCombustible;
  final double? Kilometraje;
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
      required this.Clase,
      required this.IdTipoVehiculo,
      required this.Marca,
      required this.TipoVehiculo,
      required this.TipoCombustible,
      required this.CODFASECOLDA,
      required this.IdLinea,
      required this.Linea,
      required this.Placa,
      required this.ClienteNombre,
      required this.ClienteApellido,
      required this.NumeroRevision,
      required this.Kilometraje,
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
        'IdTipoVehiculo': int IdTipoVehiculo,
        'ClienteNombre': String ClienteNombre,
        'ClienteApellido': String ClienteApellido,
        'TipoVehiculo': String TipoVehiculo,
        'Placa': String Placa,
        'Modelo': String Modelo,
        'NumeroRevision': int NumeroRevision,
        'Color': String Color,
        'Marca': String Marca,
        'CODFASECOLDA': String CODFASECOLDA,
        'NumMotor': String NumMotor,
        'Kilometraje': double? Kilometraje,
        'TipoCombustible': String TipoCombustible,
        'NumArmado': String NumArmado,
        'NumSeguridad': String NumSeguridad,
        'NumChasis': String NumChasis,
        'Clase': String Clase,
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
            IdTipoVehiculo: IdTipoVehiculo,
            TipoVehiculo: TipoVehiculo,
            IdLinea: IdLinea,
            NumeroRevision: NumeroRevision,
            Linea: Linea,
            Placa: Placa,
            Modelo: Modelo,
            Color: Color,
            NumMotor: NumMotor,
            TipoCombustible: TipoCombustible,
            Clase: Clase,
            CODFASECOLDA: CODFASECOLDA,
            NumArmado: NumArmado,
            NumSeguridad: NumSeguridad,
            Kilometraje: Kilometraje,
            NumChasis: NumChasis,
            NumSerie: NumSerie,
            NumCabina: NumCabina,
            ClienteNombre: ClienteNombre,
            ClienteApellido: ClienteApellido,
            Marca: Marca),
      _ =>
        throw const FormatException('error al parser tipo de orden de trabajo'),
    };
  }
}
