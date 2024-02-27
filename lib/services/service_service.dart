import 'package:test_driven_app/config.dart';
import 'package:test_driven_app/entities/service_type_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<Iterable<ServiceType>> fetchServiceTypes() async {
  try {
    final response = await sendHttpRequest(
        "${AppConfiguration.baseUrl}/tiposervicio", "GET");

    if (response["statusCode"] != 200) {
      throw Exception('Error al cargar tipos de vehiculo');
    }

    return (response["data"]["body"] as List<dynamic>)
        .map((e) => ServiceType.fromJson(e));
  } catch (e) {
    throw Exception('Failed to load album');
  }
}
