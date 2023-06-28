import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.get('API_URL') != null
    ? dotenv.get('API_URL')
    : 'http://localhost:3001';
