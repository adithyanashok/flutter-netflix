import 'package:netflix_app/core/colors/url/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const trending = '$baseUrl/trending/all/day?api_key=$apiKey';
  static const search = '$baseUrl/search/movie?api_key=$apiKey';
  static const newAndHotMovies = '$baseUrl/discover/movie?api_key=$apiKey';
  static const newAndHotTv = '$baseUrl/discover/tv?api_key=$apiKey';
}
