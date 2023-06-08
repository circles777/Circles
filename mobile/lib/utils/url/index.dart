import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseUrl {
  static String baseUrl = dotenv.get('API_URL');
}
