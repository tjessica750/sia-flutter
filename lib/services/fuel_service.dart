import 'package:flutter/foundation.dart';
import 'package:test_driven_app/config.dart';
import 'package:test_driven_app/entities/fuel_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<Iterable<Fuel>> fetchFuelTypes() async {
  try {
    final response = await sendHttpRequest(
        "${AppConfiguration.baseUrl}/tipocombustible", "GET");

    if (response["statusCode"] != 200) throw Exception('Failed to load album');
    return (response["data"]["body"] as List<dynamic>)
        .map((e) => Fuel.fromJson(e));
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }

    throw Exception('Failed to load album');
  }
}
