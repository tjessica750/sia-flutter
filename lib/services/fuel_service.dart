import 'package:test_driven_app/entities/fuel_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<Iterable<Fuel>> fetchFuelTypes() async {
  try {
    final response = await sendHttpRequest(
        "https://rg9x4vhivl.execute-api.us-east-2.amazonaws.com/dev/v1/tipocombustible",
        "GET");

    if (response["statusCode"] != 200) throw Exception('Failed to load album');
    return (response["data"]["body"] as List<dynamic>)
        .map((e) => Fuel.fromJson(e));
  } catch (e) {
    print(e);

    throw Exception('Failed to load album');
  }
}
