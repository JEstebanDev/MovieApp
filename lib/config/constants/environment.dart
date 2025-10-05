import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? "No api key";
  static String movieApiToken = dotenv.env['API_TOKEN'] ?? "No api token";
  static String baseUrlMovie = dotenv.env['URL_BASE_MOVIE'] ?? "No url base";
  static String movieRouting = "/movie/";
}
