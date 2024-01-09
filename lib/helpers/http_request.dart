import "dart:convert";

import "package:http/http.dart" as http;

Future<Map<dynamic, dynamic>> sendHttpRequest(String url, String method,
    {Map<String, dynamic>? data}) async {
  try {
    late http.Response response;
    if (method.toUpperCase() == 'GET') {
      response = await http.get(Uri.parse(url));
    } else if (method.toUpperCase() == 'POST') {
      response = await http.post(Uri.parse(url), body: data);
    } else if (method.toUpperCase() == 'PUT') {
      response = await http.put(Uri.parse(url), body: data);
    } else if (method.toUpperCase() == 'DELETE') {
      response = await http.delete(Uri.parse(url));
    }

    return {
      "statusCode": response.statusCode,
      "data": json.decode(response.body)
    };
  } catch (e) {
    throw Exception(e.toString());
  }
}
