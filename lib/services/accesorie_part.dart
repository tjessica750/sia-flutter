import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:test_driven_app/entities/accessories_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<List<AccessoriePartEntity>> fetchAccesorieParts(
    String partTypeId, int idVehicleType) async {
  try {
    final response = await sendHttpRequest(
        "https://rg9x4vhivl.execute-api.us-east-2.amazonaws.com/dev/v1/tipoparte/$partTypeId/parteaccesorio?IdTipoVehiculo=$idVehicleType",
        "GET");

    if (response["statusCode"] != 200) {
      throw Exception('Failed to load part types');
    }

    return (response["data"]["body"] as List<dynamic>)
        .map((e) => AccessoriePartEntity.fromJson(e))
        .toList();
  } catch (e) {
    safePrint(e);

    throw Exception('Failed to load accesorie part');
  }
}
