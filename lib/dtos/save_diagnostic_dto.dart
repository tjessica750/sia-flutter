class Foto {
  String tipo;
  String url;

  Foto({
    required this.tipo,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'Tipo': tipo,
        'Url': url,
      };
}

class ExamenPintura {
  double pdd;
  double pdi;
  double ptd;
  double pti;
  double gdd;
  double gdi;
  double gtd;
  double gti;
  double baul;
  double techo;
  double capo;
  String diagnosticoPintura;
  String diagnosticoAA;
  String diagnosticoScanner;
  String diagnosticoBateria;
  String observacionPintura;

  ExamenPintura({
    required this.pdd,
    required this.pdi,
    required this.ptd,
    required this.pti,
    required this.gdd,
    required this.gdi,
    required this.gtd,
    required this.gti,
    required this.baul,
    required this.techo,
    required this.capo,
    required this.diagnosticoPintura,
    required this.diagnosticoAA,
    required this.diagnosticoScanner,
    required this.diagnosticoBateria,
    required this.observacionPintura,
  });

  Map<String, dynamic> toJson() => {
        'PDD': pdd,
        'PDI': pdi,
        'PTD': ptd,
        'PTI': pti,
        'GDD': gdd,
        'GDI': gdi,
        'GTD': gtd,
        'GTI': gti,
        'Baul': baul,
        'Techo': techo,
        'Capo': capo,
        'DiagnosticoPintura': diagnosticoPintura,
        'DiagnosticoAA': diagnosticoAA,
        'DiagnosticoScanner': diagnosticoScanner,
        'DiagnosticoBateria': diagnosticoBateria,
        'ObservacionPintura': observacionPintura,
      };
}

class ExamenParte {
  String idAccesorio;
  int cantidad;
  String estado;

  ExamenParte({
    required this.idAccesorio,
    required this.cantidad,
    required this.estado,
  });

  Map<String, dynamic> toJson() => {
        'IdAccesorio': idAccesorio,
        'Cantidad': cantidad,
        'Estado': estado,
      };
}

class SaveDiagnosticDTO {
  String idDiagnostico;
  List<Foto>? fotos;
  ExamenPintura? examenPintura;
  List<ExamenParte>? examenPartes;
  String? observacionesGenerales;
  int? vidaUtilBateria;
  double? valorSugerido;
  double? valorAsegurado;

  SaveDiagnosticDTO({
    required this.idDiagnostico,
    required this.fotos,
    required this.examenPintura,
    required this.examenPartes,
    required this.observacionesGenerales,
    required this.vidaUtilBateria,
    required this.valorSugerido,
    required this.valorAsegurado,
  });

  Map<String, dynamic> toJson() => {
        'IdDiagnostico': idDiagnostico,
        'Fotos': fotos?.map((foto) => foto.toJson()).toList(),
        'ExamenPintura': examenPintura?.toJson(),
        'ExamenPartes': examenPartes?.map((parte) => parte.toJson()).toList(),
        'ObservacionesGenerales': observacionesGenerales,
        'VidaUtilBateria': vidaUtilBateria,
        'ValorSugerido': valorSugerido,
        'ValorAsegurado': valorAsegurado,
      };
}
