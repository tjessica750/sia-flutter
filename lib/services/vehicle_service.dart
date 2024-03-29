import 'package:test_driven_app/config.dart';
import 'package:test_driven_app/entities/vehicle_type_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<Iterable<VehicleType>> fetchVehicleTypes() async {
  try {
    final response = await sendHttpRequest(
        "${AppConfiguration.baseUrl}/tipovehiculo", "GET");

    if (response["statusCode"] != 200) {
      throw Exception('Error al cargar tipos de vehiculo');
    }

    return (response["data"]["body"] as List<dynamic>)
        .map((e) => VehicleType.fromJson(e));
  } catch (e) {
    throw Exception('Failed to load album');
  }
}
