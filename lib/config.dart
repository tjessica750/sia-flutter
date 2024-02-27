import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfiguration {
  static final baseUrl = dotenv.env["BASE_URL"] ?? "";
}
