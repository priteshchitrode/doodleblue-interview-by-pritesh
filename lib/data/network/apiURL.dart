import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  ApiUrl._();
  static String get _baseUrl => dotenv.env["API_BASE_URL"] != null ? "${dotenv.env["API_BASE_URL"]}" : "Api base Url = null";
  static String baseUrl = _baseUrl;
  static String object = "$_baseUrl/objects";

}
