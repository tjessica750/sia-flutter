import "dart:convert";

import "package:http/http.dart" as http;

Future<Map<dynamic, dynamic>> sendHttpRequest(String url, String method,
    {Map<String, dynamic>? data}) async {
  try {
    late http.Response response;

    switch (method.toUpperCase()) {
      case 'GET':
        response = await http.get(Uri.parse(url));
        break;
      case 'POST':
        response = await http.post(Uri.parse(url), body: data);
        break;
      case 'PUT':
        response = await http.put(Uri.parse(url), body: data);
        break;
      case 'DELETE':
        response = await http.delete(Uri.parse(url));
        break;
      default:
        throw Exception("HTTP method $method not suportted");
    }

    return {
      "statusCode": response.statusCode,
      "data": json.decode(response.body)
    };
  } catch (e) {
    throw Exception(e.toString());
  }
}
