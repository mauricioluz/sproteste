import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sproteste/app/characters/model/character.dart';
import 'package:sproteste/services/api_provider.dart';
import 'package:sproteste/services/models/custom_exception.dart';
import 'package:sproteste/services/models/result_response.dart';

class CharacterController {
  final Dio _dio = Dio(ApiProvider.options);

  Future<ResultResponse<List<Character>>> fetchCharacters() async {
    ResultResponse<List<Character>> result;
    try {
      Response response = await _dio.get(ApiProvider.characterUrl);
      if (response.statusCode == 200) {
        result = ResultResponse.fromJSON(response.data["info"]);
        List<Character> characters = response.data["results"]
            .map<Character>((r) => Character.fromJSON(r))
            .toList();

        result.data = characters;
        return result;
      } else if (response.statusCode == 204) {
        result = ResultResponse.fromJSON(response.data["info"]);
        result.data = [];
        return result;
      } else {
        log(response.toString());
        throw CustomException.fromStatusCode(response.statusCode!);
      }
    } on DioError catch (dioError) {
      log(dioError.toString());
      throw CustomException.fromDioError(dioError);
    }
  }
}
