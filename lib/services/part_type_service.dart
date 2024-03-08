import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:test_driven_app/config.dart';
import 'package:test_driven_app/entities/part_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<List<PartTypeEntity>> fetchPartTypes() async {
  try {
    final response =
        await sendHttpRequest("${AppConfiguration.baseUrl}/tipoparte", "GET");

    if (response["statusCode"] != 200) {
      throw Exception('Failed to load part types');
    }

    return (response["data"]["body"] as List<dynamic>)
        .map((e) => PartTypeEntity.fromJson(e))
        .toList();
  } catch (e) {
    safePrint(e);
    throw Exception('Failed to load part types');
  }
}
