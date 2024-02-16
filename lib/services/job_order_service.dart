import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:test_driven_app/entities/job_order_entity.dart';
import 'package:test_driven_app/helpers/http_request.dart';

Future<Iterable<JobOrderEntity>> fetchAllJobOrders() async {
  try {
    final response = await sendHttpRequest(
        "https://rg9x4vhivl.execute-api.us-east-2.amazonaws.com/dev/v1/transaccionordentrabajo",
        "GET");

    if (response["statusCode"] != 200) {
      throw Exception('Failed to load jobs works');
    }

    return (response["data"]["body"] as List<dynamic>)
        .map((e) => JobOrderEntity.fromJson(e));
  } catch (e) {
    safePrint(e);

    throw Exception('Failed to load album');
  }
}
