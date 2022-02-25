import 'package:dio/dio.dart';

class ApiProvider {
  static BaseOptions options =
      BaseOptions(connectTimeout: 10000, responseType: ResponseType.json);

  static String get characterUrl => "https://rickandmortyapi.com/api/character";
}
