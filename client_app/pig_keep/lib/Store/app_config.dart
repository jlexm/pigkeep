import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String? appENV = dotenv.env['APP_ENV'];
  static String? baseAPIEndpoint = dotenv.env['BASE_API_ENDPOINT'];
}
